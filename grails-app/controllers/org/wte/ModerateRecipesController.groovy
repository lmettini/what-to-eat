package org.wte

import grails.plugins.springsecurity.Secured 
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

class ModerateRecipesController {

    def springSecurityService
    def mailService

	@Secured(["hasRole('ROLE_ADMIN')"])
    def index = { 
		def offset = params.offset ? params.offset.toInteger() : 0
		
		def recipeCriteria = Recipe.createCriteria()
		def recipes = recipeCriteria.list(max: 10, offset: offset) {
				eq("approved", false)
				eq("readyForModeration", true)
		}
	
		[recipes: recipes, total: recipes.totalCount, max: 10, offset: offset]
	}
	
	@Secured(["hasRole('ROLE_ADMIN')"])
	def edit = {
		def recipe = Recipe.get(params.id)
		if (recipe != null){
			render view: 'edit', model: [recipe: recipe]
		} else {
			flash.message = "La receta no esta disponible para moderacion"
			redirect(controller: "moderateRecipes", action: "index")
		}
	}
	
	@Secured(["hasRole('ROLE_ADMIN')"])
	def moderate = {
		def recipe = Recipe.get(params.id)
		def action = params.moderateAction
		if (action == "approve"){
			recipe.properties = params
			if (recipe.validate()){
				recipe.name = recipe.title
				recipe.approved = true
				recipe.images.clear()
				if (params.imgList != null && params.imgList.length() > 0){
					def images = params.imgList.split(",")
					images.each {imgId->	
		            	recipe.addToImages(Image.get(imgId))
		        	}
				}
				recipe.save(flush: true)
				flash.message = "La receta ha sido aprobada"
				redirect(controller: "moderateRecipes", action: "index")
			} else {
			 	render view: 'edit', model: [recipe: recipe]
			}
		} else if (action == "reject"){
				def user = recipe.user
				def recipeName = recipe.name
				def components = RecipeComponent.findAllByRecipe(recipe)
				def winners = Winner.findAllByRecipe(recipe)
				def likes = UserLikeRecipe.findAllByRecipe(recipe)
            	try {
			    	components*.delete(flush: true)
					winners*.delete(flush: true)
					likes*.delete(flush: true)
					recipe.removePointsToUser()
                	recipe.delete(flush: true)
					def conf = SpringSecurityUtils.securityConfig
					mailService.sendMail {
						to user.email
						from conf.ui.register.emailFrom
						subject "HoyQueComemos - Receta moderada" 
						html view:"/email/recipeRejected", model:[recipeName:recipeName, rejectDescription: params.rejectDescription]
					}
                	flash.message = "La receta ha sido borrada"
            	} catch (org.springframework.dao.DataIntegrityViolationException e) {
               		flash.message = "No se pudo borrar la receta"
           		}
				redirect(controller: "moderateRecipes", action: "index")
		} else {
		
			redirect(controller: "moderateRecipes", action: "index")
		}
		
	}

}
