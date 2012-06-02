import org.wte.*

class BootStrap {

    def init = { servletContext ->

        RecipeComponent component = new RecipeComponent(qty: 3)
        component.save(flush:true);

        MeasureUnit unit = new MeasureUnit(name: "gramos")
        unit.save(flush:true)

        Ingredient ingredient = new Ingredient(name: "Tallarines")
        ingredient.save(flush:true)

        Recipe recipe = new Recipe(name: "Fideos con tuco")
        recipe.save(flush:true)


        unit.addToComponents(component)
        ingredient.addToComponents(component)
        recipe.addToComponents(component)

        component.save(flush:true);
        unit.save(flush:true)
        ingredient.save(flush:true)
        recipe.save(flush:true)



        component = new RecipeComponent(qty: 3)
        component.save(flush:true);

        unit = new MeasureUnit(name: "cucharadas")
        unit.save(flush:true)

        ingredient = new Ingredient(name: "Pimienta")
        ingredient.save(flush:true)

        recipe = new Recipe(name: "Casuela de lentejas")
        recipe.save(flush:true)


        unit.addToComponents(component)
        ingredient.addToComponents(component)
        recipe.addToComponents(component)

        component.save(flush:true);
        unit.save(flush:true)
        ingredient.save(flush:true)
        recipe.save(flush:true)

    }
    def destroy = {
    }
}
