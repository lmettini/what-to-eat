package org.wte

import grails.converters.JSON


class IngredientController {

    def getRelated = {
        def ingredients = Ingredient.findAllByNameIlike("%${params.q}%"  )
        ingredients = ingredients.findAll {it.components.size()>0}



        render " ${params.callback} (${ingredients.collect{def tmp = [:];tmp.name=it.name;tmp.id=it.id;tmp} as JSON}) "

    }
}
