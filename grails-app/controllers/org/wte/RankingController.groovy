package org.wte

import grails.plugins.springsecurity.Secured 

class RankingController {

    def bestrecipes = {
		def maxbestrecipes = grailsApplication.config.zumos.ranking.bestrecipes.maxrecipes
		def requiredpointsmorethan = grailsApplication.config.zumos.ranking.bestrecipes.requiredpointsmorethan
		def recipes = Recipe.findAllByPointsGreaterThan(
							requiredpointsmorethan, 	
							[max:maxbestrecipes,sort:"points",order:"desc"]
						)
		[recipes: recipes, maxbestrecipes: maxbestrecipes]
 	}

 	def allrecipes = {
        def maxbestrecipes = grailsApplication.config.zumos.ranking.bestrecipes.maxrecipes
		def requiredpointsmorethan = grailsApplication.config.zumos.ranking.allrecipes.requiredpointsmorethan
		def maxrows = grailsApplication.config.zumos.ranking.allrecipes.maxrows
		def offset = params.offset ? params.offset.toInteger() : 0
		def recipesCount = Recipe.countByPointsGreaterThan(requiredpointsmorethan)
		
		def recipes = Recipe.findAllByPointsGreaterThan(
							requiredpointsmorethan, 				  
							[max:maxrows,offset:offset,sort:"points",order:"desc"] 
						)
		[recipes: recipes, total: recipesCount, max: maxrows, offset: offset, maxbestrecipes: maxbestrecipes]
	}
	
	def bestusers = {
		def maxbestusers = grailsApplication.config.zumos.ranking.bestusers.maxusers		
		
		def userCriteria = SecUser.createCriteria()
		def users = userCriteria.list(max: maxbestusers) {
				isNotEmpty("recipes")
				order("points", "desc")
		}				
						
		[users: users, maxbestusers: maxbestusers]
 	}

 	def allusers = {
        def maxbestusers = grailsApplication.config.zumos.ranking.bestusers.maxusers
		def maxrows = grailsApplication.config.zumos.ranking.allusers.maxrows
		def offset = params.offset ? params.offset.toInteger() : 0
		
		def userCriteria = SecUser.createCriteria()
		def users = userCriteria.list(max: maxrows, offset: offset) {
		    isNotEmpty("recipes")
			order("points", "desc")
		}
			
		[users: users, total: users.totalCount, max: maxrows, offset: offset, maxbestusers: maxbestusers]
	}
	
}
