package org.wte

class Recipe {

    static hasMany = [components:RecipeComponent, likes: UserLikeRecipe]

	String name
    String title
	SecUser user
    RecipeCategory category
    String summary
    String description
    String video
    Integer points

	static searchable = {
	    components component: true
	}
	
	void like(){
		this.points = this.points + 1
		this.user.points = this.user.points + 1
	}
	
	void removePointsToUser(){
		this.user.points = this.user.points - this.points
	}
	
	boolean isLikedBy(user) {
		likes.any { it.user == user }
	}
	
}
