package org.wte

class HomeController {

    def index = { 

		def recipes = Recipe.findAll(
							[max:5,sort:"points",order:"desc"]
						)
		def userCriteria = SecUser.createCriteria()
		def users = userCriteria.list(max: 10) {
				isNotEmpty("recipes")
				order("points", "desc")
		}				
						
		[recipes: recipes, users: users]

	}
}
