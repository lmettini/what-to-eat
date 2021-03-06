package org.wte

import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

class ConcursoService {

 	static transactional = true

	def springSecurityService
	def mailService

	def closeContestByMonth() {
		def cal = Calendar.instance
		int endDay = 1
		int endMonth = cal.get(Calendar.MONTH)
		int endYear = cal.get(Calendar.YEAR)
		int beginDay = 1
		int beginMonth = endMonth - 1
		int beginYear = endYear
		this.closeContest(endYear, endMonth, endDay, beginYear, beginMonth, beginDay)
	}
	
	def closeContestByDay(){
		def cal = Calendar.instance
		int endDay = cal.get(Calendar.DAY_OF_MONTH)
		int endMonth = cal.get(Calendar.MONTH)
		int endYear = cal.get(Calendar.YEAR)
		int beginDay = endDay - 1
		int beginMonth = endMonth
		int beginYear = endYear
		this.closeContest(endYear, endMonth, endDay, beginYear, beginMonth, beginDay)
	}
	
	private void closeContest(int endYear, int endMonth, int endDay, int beginYear, int beginMonth, int beginDay) {
		String key = String.valueOf(endYear) + String.valueOf(endMonth) + String.valueOf(endDay)
		Contest contest = Contest.findByKey(key)
		if (contest == null){
			def endCal = new GregorianCalendar(endYear, endMonth, endDay)
			def beginCal = new GregorianCalendar(beginYear, beginMonth, beginDay)
			def likes = UserLikeRecipe.findAllByDateCreatedBetween(beginCal.time, endCal.time)
			def recipes = likes.collect (new HashSet()) { it.recipe }
			def  winners = []		
			recipes.each{ recipe ->	
				def likesInMonth = likes.findAll { it.recipe.equals(recipe) }
				def pointsInMonth = likesInMonth.size()
				winners.add(new Winner(likes: likesInMonth, recipe: recipe, points: pointsInMonth, contest: contest))
			}
			winners.sort( { w1, w2 -> w1.points.equals(w2.points)? w1.recipe.dateCreated <=> w2.recipe.dateCreated: w1.points>w2.points? -1: 1 } as Comparator )
			contest = new Contest(key: key, year: endYear, month: endMonth, dayOfMonth: endDay)
			if (winners.size() > 0 && winners.get(0) != null){
				contest.addToWinners(winners.get(0))
				this.sendEmail(winners.get(0).recipe, 1, contest.monthDescription())
			}
			if (winners.size() > 1 && winners.get(1) != null){
				contest.addToWinners(winners.get(1))
				this.sendEmail(winners.get(1).recipe, 2, contest.monthDescription())
			}
			if (winners.size() > 2 && winners.get(2) != null){
				contest.addToWinners(winners.get(2))
				this.sendEmail(winners.get(2).recipe, 3, contest.monthDescription())
			}
			contest.save(flush:true)
		}
	}
	
	
	private sendEmail(recipe, position, month){
		def conf = SpringSecurityUtils.securityConfig
		mailService.sendMail {
			to recipe.user.email
			from conf.ui.register.emailFrom
			subject "HoyQueComemos - Su receta ha sido ganadora del concurso del mes de " + month
			html view:"/email/contestWinner", model:[recipe:recipe, month: month, position: position]
		}
	}
	
}