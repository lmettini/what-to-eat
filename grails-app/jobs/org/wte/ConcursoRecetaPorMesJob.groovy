package org.wte

class ConcursoRecetaPorMesJob {
   	
	def concursoService

	static triggers = {
		// ESTO ES PARA QUE CORRA EL PRIMER DIA DE CADA MES A LAS 0 HS
    	cron name: 'triggerConcursoPorMes', cronExpression: "0 0 0 1 * ?"
  	}

 	def group = "GrupoConcurso"

    def execute() {
		concursoService.closeContestByMonth()
    }
}
