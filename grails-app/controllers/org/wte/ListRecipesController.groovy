package org.wte

class ListRecipesController {

    def index = {
        def components = []
        def resultList = []
        def ingredientsList = []

        if(params.q){
		    def ingredientsIds = params.q.toString().split(',')
		    ingredientsIds.each {
		        components.addAll(RecipeComponent.findAllByIngredient(Ingredient.get(it.toInteger())))
		    }
        }
        List<Long> ingIds = params.q.toString().split(',').toList()
        ingredientsList = Ingredient.getAll(ingIds);

        components.each { cp ->
            def recipe = resultList.find{it.recipe==cp.recipe}
            if(recipe){
                recipe.ingredients.add(cp.ingredient)
            }else{
                resultList.add(new RecipiesListByIngredientRow(recipe:cp.recipe,ingredients:[cp.ingredient]))
            }
        }

        resultList.sort({it.ingredients.size() * -1})

        [   "components":components,
            "resultList":resultList,
            "ingredients": ingredientsList]

    }
}
