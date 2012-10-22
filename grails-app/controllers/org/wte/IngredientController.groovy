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
        if(ingredients.size()>20){
            ingredients = ingredients[0..19]
        }
        render " ${params.callback} (${ingredients.collect{def tmp = [:];tmp.name=it.name;tmp.id=it.id;tmp} as JSON}) "
    }
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def save = {
		Ingredient ingredient = Ingredient.findByName(params.name);
		if (ingredient != null){
			if (ingredient.approved == true){
				render "El ingrediente ya se encuentra en nuestra base de datos" 
				return
			} else {
				if (ingredient.creator == springSecurityService.currentUser){
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
