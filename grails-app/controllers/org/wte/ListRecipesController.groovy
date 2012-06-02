package org.wte

class ListRecipesController {

    def index = {
        def ingredientsIds = params.id.toString().split(',')
        def components = []
        ingredientsIds.each {
            components.addAll(RecipeComponent.findByIngredient(Ingredient.get(it.toInteger())))
        }

        ["components":components]

    }
}
