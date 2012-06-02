package org.wte

class Ingredient {

    static hasMany = [components:RecipeComponent]

    String name

    static constraints = {
    }

    static mapping = {
        components cascade: "all-delete-orphan"

    }
}
