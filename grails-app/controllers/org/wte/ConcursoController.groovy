package org.wte

class ConcursoController {

	def concursoService
	
	def index = {
		def cal = Calendar.instance
		int endDay = cal.get(Calendar.DAY_OF_MONTH) + 1
		int endMonth = cal.get(Calendar.MONTH)
		int endYear = cal.get(Calendar.YEAR)
		String key = String.valueOf(endYear) + String.valueOf(endMonth) + String.valueOf(endDay)
		Contest contest = Contest.findByKey(key)
		def list = contest.winners.sort( { w1, w2 -> w2.points <=> w1.points } as Comparator )
		[contest: contest, winners: list]
	}
	
	def closeContestByMonth = {
		concursoService.closeContestByMonth()
	}

	def closeContestByDay = {
		concursoService.closeContestByDay()
	}

}