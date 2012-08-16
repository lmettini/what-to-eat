package org.wte

import grails.plugins.springsecurity.Secured 

class RecipeController {

	@Secured(['IS_AUTHENTICATED_FULLY'])
    def create ={
        [:]
    }

    def show ={
        def recipeToShow = Recipe.get(params.r)
        [recipe: recipeToShow, recipeComponents: recipeToShow.components]
    }
}
