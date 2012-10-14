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

        resultList.sort({it.recipe.points * -1})

        [   "components":components,
            "resultList":resultList,
            "ingredients": ingredientsList]

    }
	
	def simpleSearch = {	
			def maxrows = 10
			def offset = params.offset ? params.offset.toInteger() : 0

			def recipeCriteria = Recipe.createCriteria()
			def recipes = recipeCriteria.list(max: maxrows, offset: offset) {
				order("points", "desc")
				or {
				        user{
							ilike("username", "%" + params.query + "%")
						}
						ilike("title", "%" + params.query + "%")
				    }
			}
			[recipes: recipes, total: recipes.totalCount, max: maxrows, offset: offset]
	
	}

}
