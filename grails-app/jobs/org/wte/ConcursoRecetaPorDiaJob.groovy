package org.wte

class ConcursoRecetaPorDiaJob {
   	
	def concursoService

	static triggers = {
		// ESTO ES PARA QUE CORRA TODOS LOS DIAS A LAS 0:15 HS. ES PARA PRUEBAS
		cron name: 'triggerConcursoPorDia', cronExpression: "0 15 0 * * ? *"
  	}

 	def group = "GrupoConcurso"

    def execute() {
		concursoService.closeContestByDay()
    }
}
