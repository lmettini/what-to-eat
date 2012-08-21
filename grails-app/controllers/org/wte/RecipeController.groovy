package org.wte

import grails.plugins.springsecurity.Secured 

class RecipeController {

	def springSecurityService

	@Secured(['IS_AUTHENTICATED_FULLY'])
    def create ={
        [:]
    }

    @Secured(['IS_AUTHENTICATED_FULLY'])
    def edit ={
        def recipeToEdit = Recipe.get(params.id)
        [recipe:recipeToEdit, recipeComponents: recipeToEdit.components]
    }

    @Secured(['IS_AUTHENTICATED_FULLY'])
	def list = {
		def recipes = Recipe.findAllByUser(springSecurityService.currentUser)
		[recipes: recipes]
	}

    def show ={
        def recipeToShow = Recipe.get(params.id)
		def isNotAUserRecipe = recipeToShow.user != springSecurityService.currentUser
		def isLikedByCurrentUser = recipeToShow.isLikedBy(springSecurityService.currentUser)
        [recipe: recipeToShow, recipeComponents: recipeToShow.components, isNotAUserRecipe: isNotAUserRecipe, isLikedByCurrentUser: isLikedByCurrentUser ]
    }

    @Secured(['IS_AUTHENTICATED_FULLY'])
	def like = {
		def currentUser = springSecurityService.currentUser
		def recipe = Recipe.get(params.id)
		if (recipe.user == springSecurityService.currentUser){
			flash.message = "Usted no puede votar su propia receta"
		} else {
			if (recipe.isLikedBy(springSecurityService.currentUser)){
				flash.message = "Usted ya voto esta receta"
			} else {
				def userLikeRecipe = new UserLikeRecipe(user: currentUser, recipe: recipe)
				recipe.addToLikes(userLikeRecipe)
				recipe.points = recipe.points + 1;
				recipe.save(flush: true)
				currentUser.addToLikes(userLikeRecipe)
				currentUser.save(flush: true)
				flash.message = "La votacion se realizó con éxito"
			}
		}
		redirect(action: "show", id: recipe.id)
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def delete = {
        def recipe = Recipe.get(params.id)
     	if (recipe) {
 			if (recipe.user == springSecurityService.currentUser){
				def components = RecipeComponent.findAllByRecipe(recipe)
            	try {
			    	components*.delete(flush: true)
                	recipe.delete(flush: true)
                	flash.message = "La receta ha sido borrada"
                	redirect(action: "list")
            	} catch (org.springframework.dao.DataIntegrityViolationException e) {
               		flash.message = "No se pudo borrar la receta"
           		}
       		} else {
            	flash.message = "No puede borrar una receta que fue creada por otro usuario"
        	}
		} else {
			flash.message = "No se encontro la receta"
		}
		redirect(action: "list")
    }

}
