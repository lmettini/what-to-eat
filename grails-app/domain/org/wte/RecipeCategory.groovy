package org.wte

class RecipeCategory {
    static hasMany = [components:Recipe]

    String description

}
