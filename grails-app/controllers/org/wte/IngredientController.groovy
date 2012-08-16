package org.wte

import grails.converters.JSON
import grails.plugins.springsecurity.Secured 

class IngredientController {

	def springSecurityService

    def getRelated = {
        def ingredients = Ingredient.findAllByNameIlike("%${params.q}%"  )
        ingredients = ingredients.findAll {it.components.size()>0}

        render " ${params.callback} (${ingredients.collect{def tmp = [:];tmp.name=it.name;tmp.id=it.id;tmp} as JSON}) "

    }
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def save = {
		Ingredient ingredient = new Ingredient(params)
		ingredient.creator = springSecurityService.currentUser
		ingredient.approved = false
		  if (ingredient.save(flush: true)) { 
			render "El ingrediente se creo con exito" 
		  } else {
			render "No se pudo crear el ingrediente" 
		  }
	}
	
}
