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
        List<String> ingIds = params.q.toString().split(',').toList()
        ingredientsList = Ingredient.getAll(ingIds);

        components.each { cp ->
            def recipe = resultList.find{it.recipe==cp.recipe}
            if(recipe){
                recipe.ingredients.add(cp.ingredient)
            }else{
                resultList.add(new RecipiesListByIngredientRow(recipe:cp.recipe,ingredients:[cp.ingredient]))
            }
        }

         resultList = resultList.sort({it.recipe.points * -1})

        def searchIds = ingredientsList.collect {it.id}

        def full =resultList.findAll{rec -> rec.recipe.components.findAll{!searchIds.contains(it.ingredient.id)}.size()==0}
             def mid = resultList.findAll{rec -> rec.recipe.components.findAll{!searchIds.contains(it.ingredient.id)}.size()>0 && rec.recipe.components.findAll{!searchIds.contains(it.ingredient.id)}.size()<=2}

        def maxrows = 10
        def offset = params.offset ? params.offset.toInteger() : 0
        def init=maxrows*offset,end=maxrows*offset+maxrows-1


        def all = full
        all.addAll(mid)

        if(all.size()>0){
            if(end>all.size()) end = all.size()-1

            all = all[init..end]

            full =all.findAll{rec -> rec.recipe.components.findAll{!searchIds.contains(it.ingredient.id)}.size()==0}
            mid =all.findAll{rec -> rec.recipe.components.findAll{!searchIds.contains(it.ingredient.id)}.size()>0 && rec.recipe.components.findAll{!searchIds.contains(it.ingredient.id)}.size()<=2}
        }

        [   "components":components,
            "resultList":resultList,
            "ingredients": ingredientsList,
            "fullMatchList":full,
            "midMatchList":mid,
            "total":all.size(),
            "maxrows":maxrows,
            "query":params.q]

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
