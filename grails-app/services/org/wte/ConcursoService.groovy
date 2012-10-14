package org.wte

class ConcursoService {

	def closeContestByMonth() {
		def cal = Calendar.instance
		int endDay = cal.get(Calendar.DAY_OF_MONTH)
		int endMonth = cal.get(Calendar.MONTH)
		int endYear = cal.get(Calendar.YEAR)
		int beginDay = endDay
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
				winners.add(new Winner(likes: likesInMonth, recipe: recipe, points: pointsInMonth))
			}

			winners.sort( { w1, w2 -> w2.points <=> w1.points } as Comparator )

			contest = new Contest(key: key, year: endYear, month: endMonth, dayOfMonth: endDay)
			contest.winners = []
			if (winners.size() > 0 && winners.get(0) != null){
				contest.winners.add(winners.get(0))
			}
			if (winners.size() > 1 && winners.get(1) != null){
				contest.winners.add(winners.get(1))
			}
			if (winners.size() > 2 && winners.get(2) != null){
				contest.winners.add(winners.get(2))
			}
			contest.save(flush:true)
		}
	}
	
}