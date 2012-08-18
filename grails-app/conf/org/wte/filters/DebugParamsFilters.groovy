package org.wte.filters

class DebugParamsFilters {

  def filters = {
    paramLogger(controller:'*', action:'*') {
      before = {
		println "---------------------------------------------------------------"
        println "REQUEST PARAMS: " + params
	    println "---------------------------------------------------------------"
      }
    }
  }

}