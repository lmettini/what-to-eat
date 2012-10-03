package org.wte

class MeasureUnit {

    static hasMany = [components:RecipeComponent]

    Long id
    String name

    static constraints = {
		name blank: false, unique: true
    }

    static mapping = {
        cache true
        version false
    }
}
