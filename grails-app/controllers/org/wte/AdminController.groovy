package org.wte

import grails.plugins.springsecurity.Secured 

class AdminController {

	@Secured(["hasRole('ROLE_ADMIN')"])
    def index = { }

	def ingredients = {
		def offset = params.offset ? params.offset.toInteger() : 0
		def ingredientsCount = Ingredient.countByApproved(false)
		
		def ingredients = Ingredient.findAllByApproved(false, [max:10,offset:offset])
	
		[ingredients: ingredients, total: ingredientsCount, max: 10, offset: offset]
	}

}
