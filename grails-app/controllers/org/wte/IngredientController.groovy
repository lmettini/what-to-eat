package org.wte

import grails.converters.JSON


class IngredientController {

    def getRelated = {
        def ingredients = Ingredient.findAllByNameIlike("%${params.id}%"  )
        ingredients = ingredients.findAll {it.components.size()>0}

        render " ${params.callback} (${ingredients as JSON}) "

    }
}
