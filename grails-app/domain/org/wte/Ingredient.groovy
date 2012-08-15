package org.wte

class Ingredient {

    static hasMany = [components:RecipeComponent]
	
	SecUser creator
	boolean approved = true
    String name

    static constraints = {
		creator nullable: true
    }

    static mapping = {
        components cascade: "all-delete-orphan"
    }

	static searchable = {
	    only: "name"
		root false
	}
}
