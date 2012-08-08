package org.wte

class Recipe {

    static hasMany = [components:RecipeComponent, likes: UserLikeRecipe]

    String title
    SecUser user
    RecipeCategory category
    String summary
    String description

    static constraints = {
        title blank: false
        user blank: false
        category blank: false
    }

	static searchable = {
	    components component: true
	}
}
