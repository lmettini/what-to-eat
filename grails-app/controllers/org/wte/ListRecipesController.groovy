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


	def contest = {
		def cal = Calendar.instance
		int month = cal.get(Calendar.MONTH)
		int year = cal.get(Calendar.YEAR)
		def todayCal = new GregorianCalendar(year, month, 1)
		def previousMonthCal = new GregorianCalendar(year, month - 1, 1)
		
		def likes = UserLikeRecipe.findAllByDateCreatedBetween(previousMonthCal.time, todayCal.time)
		def recipes = likes.collect (new HashSet()) { it.recipe }
		def  winners = []		
		recipes.each{ recipe ->	
			def likesInMonth = likes.findAll { it.recipe.equals(recipe) }
			def pointsInMonth = likesInMonth.size()
			winners.add(new Winner(likes: likesInMonth, recipe: recipe, points: pointsInMonth))
		}
		 
		winners.sort( { w1, w2 -> w2.points <=> w1.points } as Comparator )
		
		Contest c = new Contest()
		c.month = previousMonthCal.get(Calendar.MONTH)
		c.year = previousMonthCal.get(Calendar.YEAR)
		c.winners = []
		if (winners.size() > 0 && winners.get(0) != null){
			c.winners.add(winners.get(0))
		}
		if (winners.size() > 1 && winners.get(1) != null){
			c.winners.add(winners.get(1))
		}
		if (winners.size() > 2 && winners.get(2) != null){
			c.winners.add(winners.get(2))
		}
		c.save(flush:true)
		
      	[contest: c]
	}



}
