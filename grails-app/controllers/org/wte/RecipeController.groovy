package org.wte

class RecipeController {

    def create ={
        [:]
    }

    def show ={
        def recipeToShow = Recipe.get(params.r)
        [recipe: recipeToShow, recipeComponents: recipeToShow.components]
    }
}
