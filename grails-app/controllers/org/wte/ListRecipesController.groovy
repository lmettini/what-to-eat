package org.wte

class ListRecipesController {

    def index = {
        def components = []
        
        if(params.id){
		    def ingredientsIds = params.id.toString().split(',')
		    ingredientsIds.each {
		        components.addAll(RecipeComponent.findAllByIngredient(Ingredient.get(it.toInteger())))
		    }
        }

        ["components":components]

    }
}
