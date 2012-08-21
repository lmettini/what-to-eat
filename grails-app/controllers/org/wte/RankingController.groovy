package org.wte

import grails.plugins.springsecurity.Secured 

class RankingController {

    def bestrecipes = {
		def recipes = Recipe.findAllByPointsGreaterThan(
							grailsApplication.config.zumos.ranking.bestrecipes.requiredpointsmorethan, 	
							[
								max:grailsApplication.config.zumos.ranking.bestrecipes.maxrecipes, 
								sort:"points", 
								order:"desc"
							]
						)
		[recipes: recipes]
 	}

 	def allrecipes = {
		def requiredpointsmorethan = grailsApplication.config.zumos.ranking.allrecipes.requiredpointsmorethan;
		def maxrows = grailsApplication.config.zumos.ranking.allrecipes.maxrows
		def offset = params.offset ? params.offset.toInteger() : 0
		def recipesCount = Recipe.countByPointsGreaterThan(requiredpointsmorethan)
		
		def recipes = Recipe.findAllByPointsGreaterThan(
							requiredpointsmorethan, 				  
							[max:maxrows,offset:offset,sort:"points",order:"desc"] 
						)
		[recipes: recipes, total: recipesCount, max: maxrows, offset: offset]
	}
}
