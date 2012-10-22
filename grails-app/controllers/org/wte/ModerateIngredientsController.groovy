package org.wte

import grails.plugins.springsecurity.Secured 
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

class ModerateIngredientsController {

    def springSecurityService
    def mailService

	@Secured(["hasRole('ROLE_ADMIN')"])
    def index = { 
		def offset = params.offset ? params.offset.toInteger() : 0
		def ingredientsCount = Ingredient.countByApproved(false)
		
		def ingredients = Ingredient.findAllByApproved(false, [max:10,offset:offset])
	
		[ingredients: ingredients, total: ingredientsCount, max: 10, offset: offset]
	}
	
	@Secured(["hasRole('ROLE_ADMIN')"])
	def edit = {
		def ingredient = Ingredient.get(params.id)
		[ingredient: ingredient]
	}

	@Secured(["hasRole('ROLE_ADMIN')"])
	def moderate = {
		def ingredient = Ingredient.get(params.id)
		def action = params.moderateAction
		if (action == "approve"){
			ingredient.properties = params
			if (ingredient.validate()){
				ingredient.approved = true
				ingredient.save(flush: true)
				if (ingredient.components != null){
					ingredient.components.each { cp ->
							if (cp.recipe.hasAllIngredientsApproved()){
								cp.recipe.readyForModeration = true
							} else {
								cp.recipe.readyForModeration = false
							}
							cp.recipe.save(flush: true)
				    }
				}
                flash.message = "El ingrediente ha sido aprobado"
				redirect(controller: "moderateIngredients", action: "index")
			} else {
			 	render view: 'edit', model: [ingredient: ingredient]
			}
		} else if (action == "reject"){
			def recipeComponents = RecipeComponent.findAllByIngredient(ingredient)
			recipeComponents.each { component ->
				def recipe = component.recipe
			  	def components = RecipeComponent.findAllByRecipe(recipe)
				def winners = Winner.findAllByRecipe(recipe)
				def likes = UserLikeRecipe.findAllByRecipe(recipe)
        		try {
		    		components*.delete(flush: true)
					winners*.delete(flush: true)
					likes*.delete(flush: true)
					recipe.removePointsToUser()
            		recipe.delete(flush: true)
                    flash.message = "El ingrediente ha sido borrado"
        		} catch (org.springframework.dao.DataIntegrityViolationException e) {
                    flash.message = "No se pudo borrar el ingrediente"
           			println e
       			}
			}
			def user = ingredient.creator
			def ingredientName = ingredient.name
			ingredient.delete(flush: true)
			if (user != null){
				def conf = SpringSecurityUtils.securityConfig
				mailService.sendMail {
					to user.email
					from conf.ui.register.emailFrom
					subject "HoyQueComemos - Ingrediente moderado"
					html view:"/email/ingredientRejected", model:[ingredientName:ingredientName, rejectDescription: params.rejectDescription]
				}
			}
			redirect(controller: "moderateIngredients", action: "index")
		} else {
		
			redirect(controller: "moderateIngredients", action: "index")
		}
		
	}
	
	

}
