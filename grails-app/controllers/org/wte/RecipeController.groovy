package org.wte

import grails.plugins.springsecurity.Secured
import grails.converters.JSON

class RecipeController {

	def springSecurityService

	@Secured(['IS_AUTHENTICATED_FULLY'])
    def create ={
        def measureUnits = MeasureUnit.getAll()
        def categories = RecipeCategory.getAll()

        ["action":"create",
        "measureUnits":measureUnits,
        "categories":categories]
    }

    @Secured(['IS_AUTHENTICATED_FULLY'])
    def edit ={
        def recipeToEdit = Recipe.get(params.id)
		if (recipeToEdit.user == springSecurityService.currentUser){
        	def categories = RecipeCategory.getAll()
        	def measureUnits = MeasureUnit.getAll()

        	["action":"edit",
        	"recipe":recipeToEdit,
        	"recipeComponents": recipeToEdit.components,
        	"measureUnits":measureUnits,
        	"categories":categories]
		} else {
			flash.message = "No puede editar una receta que fue creada por otro usuario"
			redirect(controller:"home",action:"index")
		}
    }

    @Secured(['IS_AUTHENTICATED_FULLY'])
	def list = {
		def recipes = Recipe.findAllByUser(springSecurityService.currentUser)
		[recipes: recipes]
	}

    def show ={
        if(!params.id.toString().isLong()){
            render(view:"notFound",model:[])
            return
        }

        def recipeToShow = Recipe.get(params.id)

        if(recipeToShow==null){
            render(view:"notFound",model:[])
            return
        }

		def isNotAUserRecipe = recipeToShow?.user != springSecurityService.currentUser
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
				recipe.like()
				recipe.addToLikes(userLikeRecipe)
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
				def likes = UserLikeRecipe.findAllByRecipe(recipe)
            	try {
			    	components*.delete(flush: true)
					likes*.delete(flush: true)
					recipe.removePointsToUser()
                	recipe.delete(flush: true)
                	flash.message = "La receta ha sido borrada"
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

	@Secured(['IS_AUTHENTICATED_FULLY'])
    def save = {
        def data = params.data

        def dataJson = JSON.parse(data)

        def user = springSecurityService.currentUser
        Recipe nRecipe = null
        if(dataJson.recipeId == null || dataJson.recipeId == 'undefined'){
            nRecipe = new Recipe(name: dataJson.title, title: dataJson.title, user: user, summary: dataJson.summary, description: dataJson.descripcion, video: dataJson.video, points: 0,category: RecipeCategory.get(Long.parseLong(dataJson.categ)))
        }else{
            nRecipe = Recipe.get(Long.parseLong(dataJson.recipeId))
			if (nRecipe.user != springSecurityService.currentUser){
				flash.message = "No puede editar una receta que fue creada por otro usuario"
				redirect(controller:"home",action:"index")
			}
            nRecipe.name = dataJson.title
            nRecipe.title = dataJson.title
            nRecipe.user = user
            nRecipe.summary = dataJson.summary
            nRecipe.description = dataJson.descripcion
            nRecipe.video = dataJson.video
            nRecipe.points = nRecipe.points
            nRecipe.category = RecipeCategory.get(Long.parseLong(dataJson.categ))
			  // borro todos los ingredientes y los agrego cada vez
				def components = []
				components += nRecipe.components
				components.each { cp ->
				    nRecipe.removeFromComponents(cp)
				    cp.delete()
				}
        }
        
        nRecipe.save(flush:true)

        dataJson.ingredientes.each { ing ->
            def component = new RecipeComponent(qty: ing.qty)
            component.save(flush:true);

            def unit
            if(ing.unit!="0" && ing.unit!=""){
                unit = MeasureUnit.get(ing.unit)
                unit.addToComponents(component)
            }
            def ingred = Ingredient.get(ing.ingredId)

            ingred.addToComponents(component)
            nRecipe.addToComponents(component)

            component.save(flush:true)
            ingred.save(flush:true)

            if(ing.unit!="0" && ing.unit!=""){
                unit.save(flush:true)
            }

			if (nRecipe.hasAllIngredientsApproved()){
				nRecipe.readyForModeration = true;
			} else {
				nRecipe.readyForModeration = false;
			}
			nRecipe.approved = false
            nRecipe.save(flush:true)
        }

        dataJson.images.each {img->
            nRecipe.addToImages(Image.get(img))
            nRecipe.save(flush:true)
        }

        redirect([ action: "show", id:nRecipe.id])

    }

}
