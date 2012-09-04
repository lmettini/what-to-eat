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
				redirect(controller: "moderateIngredients", action: "index")
			} else {
			 	render view: 'edit', model: [ingredient: ingredient]
			}
		} else if (action == "reject"){
			def recipeComponents = RecipeComponent.findAllByIngredient(ingredient)
			recipeComponents.each { component ->
				def recipe = component.recipe
			  	def components = RecipeComponent.findAllByRecipe(recipe)
				def likes = UserLikeRecipe.findAllByRecipe(recipe)
        		try {
		    		components*.delete(flush: true)
					likes*.delete(flush: true)
					recipe.removePointsToUser()
            		recipe.delete(flush: true)
        		} catch (org.springframework.dao.DataIntegrityViolationException e) {
           			println e
       			}
			}
			def user = ingredient.creator
			def ingredientName = ingredient.name
			ingredient.delete(flush: true)
			def conf = SpringSecurityUtils.securityConfig
			mailService.sendMail {
				to user.email
				from conf.ui.register.emailFrom
				subject conf.ui.register.emailSubject
				html "El ingrediente: " + ingredientName + " se ha rechazado. El ingrediente y todas las recetas asociadas han sido eliminadas de nuestro sistema. Motivo de rechazo: " + params.rejectDescription
			}
			redirect(controller: "moderateIngredients", action: "index")
		} else {
		
			redirect(controller: "moderateIngredients", action: "index")
		}
		
	}
	
	

}