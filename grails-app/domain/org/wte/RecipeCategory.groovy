package org.wte

class RecipeCategory {
    static hasMany = [components:Recipe]

    String description


 	static constraints = {
		description blank: false, unique: true
    }
}
