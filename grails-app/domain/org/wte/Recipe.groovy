package org.wte

class Recipe {

    static hasMany = [components:RecipeComponent, likes: UserLikeRecipe, images: Image]

	String name
    String title
	SecUser user
    RecipeCategory category
    String summary
    String description
    String video
    Integer points
	boolean approved = false
	boolean readyForModeration = true;

	Date dateCreated
    Date lastUpdated

	static constraints = {
		name blank: false, size: 1..100
		title blank: false, size: 1..100
		summary size: 0..200
		description size: 0..5000
	}

	static searchable = {
	    components component: true
	}
	
	
	
	Image firstImage(){
		if (this.images != null && this.images.size() > 0){
			return (Image) this.images.toArray()[0]
		} else {
			return null;
		}
	}
	
	boolean hasAllIngredientsApproved(){
		def ready = true
		components.each { cp ->
				if (!cp.ingredient.approved){
					ready = false;
				}	           
	    }
		return ready;
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
