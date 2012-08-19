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

    def delete = {
        def recipe = Recipe.get(params.id)
		def components = RecipeComponent.findAllByRecipe(recipe)
        if (recipe) {
            try {
			    components*.delete(flush: true)
                recipe.delete(flush: true)
                flash.message = "La receta ha sido borrada"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "No se pudo borrar la receta"
                redirect(action: "list")
            }
        }
        else {
            flash.message = "No se encontro la receta"
            redirect(action: "list")
        }
    }

}
