package org.wte

class Recipe {

    static hasMany = [components:RecipeComponent]

    String name

    static constraints = {
    }

}
