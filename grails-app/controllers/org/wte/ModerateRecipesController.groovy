package org.wte

import grails.plugins.springsecurity.Secured 
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

class ModerateRecipesController {

    def springSecurityService
    def mailService

	@Secured(["hasRole('ROLE_ADMIN')"])
    def index = { 
		def offset = params.offset ? params.offset.toInteger() : 0
		def recipesCount = Recipe.countByApproved(false)
		
		//def recipes = Recipe.findAllByApproved(false, [max:10,offset:offset])
		
		def recipeCriteria = Recipe.createCriteria()
		def recipes = recipeCriteria.list(max: 10) {
				eq("approved", false)
				eq("readyForModeration", true)
		}
	
		[recipes: recipes, total: recipesCount, max: 10, offset: offset]
	}

}
