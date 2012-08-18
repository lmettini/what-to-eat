package org.wte

import grails.plugins.springsecurity.Secured 

class RecipeController {

	def springSecurityService

	@Secured(['IS_AUTHENTICATED_FULLY'])
    def create ={
        [:]
    }

    @Secured(['IS_AUTHENTICATED_FULLY'])
	def list = {
		def recipes = Recipe.findAllByUser(springSecurityService.currentUser)
		[recipes: recipes]
	}

    def show ={
        def recipeToShow = Recipe.get(params.r)
        [recipe: recipeToShow, recipeComponents: recipeToShow.components]
    }
}
