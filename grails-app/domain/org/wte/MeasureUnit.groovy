package org.wte

class MeasureUnit {

    static hasMany = [components:RecipeComponent]

    Long id
    String name

    static constraints = {
    }

    static mapping = {
        cache true
        version false
    }
}
