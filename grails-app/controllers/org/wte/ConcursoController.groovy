package org.wte

class ConcursoController {

	def concursoService
	
	def index = {
		def cal = Calendar.instance
		//CUANDO HAYA QUE DEJAR EL CONCURSO DEL MES PONER LA LINEA DE ABAJO
		//int endDay = 1
		int endDay = cal.get(Calendar.DAY_OF_MONTH)
		int endMonth = cal.get(Calendar.MONTH)
		int endYear = cal.get(Calendar.YEAR)
		String key = String.valueOf(endYear) + String.valueOf(endMonth) + String.valueOf(endDay)
		Contest contest = Contest.findByKey(key)
		if (contest == null){
			//concursoService.closeContestByMonth()
			concursoService.closeContestByDay()
			contest = Contest.findByKey(key)
		} 
		def list = [] 
		if (contest.winners != null && contest.winners.size() > 0){
			list = contest.winners.sort( { w1, w2 -> w1.points.equals(w2.points)? w1.recipe.dateCreated <=> w2.recipe.dateCreated: w1.points>w2.points? -1: 1 } as Comparator )
		}
		[contest: contest, winners: list]
	}
	
}