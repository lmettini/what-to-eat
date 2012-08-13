package org.wte

class Recipe {

    static hasMany = [components:RecipeComponent, likes: UserLikeRecipe]

	String name
    String title
/*    SecUser user          */
    RecipeCategory category
    String summary
    String description
    String video
    Integer points

	static searchable = {
	    components component: true
	}
}
