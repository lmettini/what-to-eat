package org.wte

import grails.converters.JSON
import grails.plugins.springsecurity.Secured 

class IngredientController {

	def springSecurityService
	
    def getRelated = {
		def ingCriteria = Ingredient.createCriteria()
		def ingredients = ingCriteria {
	    	ilike("name", "%${params.q}%")
			eq("approved", true)
		}
        ingredients = ingredients.sort({it.name.length()})
        ingredients = ingredients.sort({it.name.toUpperCase().indexOf(params.q.toString().toUpperCase())})
        if(ingredients.size()>20){
            ingredients = ingredients[0..19]
        }
        render " ${params.callback} (${ingredients.collect{def tmp = [:];tmp.name=it.name;tmp.id=it.id;tmp} as JSON}) "
    }
	
	def getRelatedForCreation = {	
		def ingCriteria = Ingredient.createCriteria()
		def ingredients = ingCriteria {
	    	ilike("name", "%${params.q}%")
			or {
	        	eq("approved", true)
	        	and {
			        eq("approved", false)
			        eq("creator", springSecurityService.currentUser)
			    }
	    	}
		}
        ingredients = ingredients.sort({it.name.length()})
        ingredients = ingredients.sort({it.name.toUpperCase().indexOf(params.q.toString().toUpperCase())})
        if(ingredients.size()>20){
            ingredients = ingredients[0..19]
        }
        render " ${params.callback} (${ingredients.collect{def tmp = [:];tmp.name=it.name;tmp.id=it.id;tmp} as JSON}) "
    }
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def save = {
        def ingToAdd = params.name.capitalize().toString();
		Ingredient ingredient = Ingredient.findByName(ingToAdd);
		if (ingredient != null){
			if (ingredient.approved == true){
				render "El ingrediente ya se encuentra en nuestra base de datos" 
				return
			} else {
				ingredient = Ingredient.findByNameAndCreator(params.name, springSecurityService.currentUser)
				if (ingredient != null){
					render "Usted ya ha creado este ingrediente. Ya puede utilizarlo" 
					return
				}
			}
		}

		ingredient = new Ingredient(params)
		ingredient.creator = springSecurityService.currentUser
		ingredient.approved = false
		  if (ingredient.save(flush: true)) { 
			render "El ingrediente se creo con exito" 
		  } else {
			render "No se pudo crear el ingrediente"
		  }
	}
	
}
