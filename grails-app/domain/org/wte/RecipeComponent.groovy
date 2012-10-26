package org.wte

class RecipeComponent {

    //static belongsTo = [ingredient:Ingredient,recipe:Recipe,unit:MeasureUnit]
    Ingredient ingredient
    Recipe recipe
    MeasureUnit unit

    Integer qty
	
	static searchable = {
	    ingredient component: true
	 	root false
	}
	
    static constraints = {
         qty(nullable: true)
         unit(nullable: true)
    }

}
