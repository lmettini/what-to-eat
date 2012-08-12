import org.wte.*

class BootStrap {

    def init = { servletContext ->

        // defino algunas unidades de medida
        MeasureUnit gramos = new MeasureUnit(name: "gramos")
        gramos.save(flush:true)

        MeasureUnit cucharada = new MeasureUnit(name: "cucharadas")
        cucharada.save(flush:true)


        // defino ingredientes
        Ingredient tallarines = new Ingredient(name: "Tallarines")
        tallarines.save(flush:true)

        Ingredient pimienta = new Ingredient(name: "Pimienta")
        pimienta.save(flush:true)

        Ingredient lenteja = new Ingredient(name: "Lenteja")
        lenteja.save(flush:true)

        Ingredient panceta = new Ingredient(name: "Panceta")
        panceta.save(flush:true)

        Ingredient tomate = new Ingredient(name: "Tomate")
        tomate.save(flush:true)

        // defino recetas
        Recipe fideos = new Recipe(name: "Fideos con tuco", title: "Fideos con tuco", summary:"Fideos con tuco de la nona", description: "los mejores fideos que podes probar en tu vida")
        fideos.save(flush:true)

        Recipe casuelaLentejas = new Recipe(name: "Casuela de lentejas", title: "Casuela de lentejas", summary: "Casuela de lentejas de la tia", description: "Casuela de lentejas de la tia, la mejor del condado" )
        casuelaLentejas.save(flush:true)


        RecipeComponent component
        // agrego tallarines a la receta de fideos
        component = new RecipeComponent(qty: 100)
        component.save(flush:true);

        gramos.addToComponents(component)
        tallarines.addToComponents(component)
        fideos.addToComponents(component)

        component.save(flush:true);
        gramos.save(flush:true)
        tallarines.save(flush:true)
        fideos.save(flush:true)


        // agrego pimienta a la receta de pimienta
        component = new RecipeComponent(qty: 2)
        component.save(flush:true);

        cucharada.addToComponents(component)
        pimienta.addToComponents(component)
        casuelaLentejas.addToComponents(component)

        component.save(flush:true);
        cucharada.save(flush:true)
        pimienta.save(flush:true)
        casuelaLentejas.save(flush:true)

        // agrego lentejas a la casuela de lentejas
        component = new RecipeComponent(qty: 50)
        component.save(flush:true);

        gramos.addToComponents(component)
        lenteja.addToComponents(component)
        casuelaLentejas.addToComponents(component)

        component.save(flush:true);
        gramos.save(flush:true)
        lenteja.save(flush:true)
        casuelaLentejas.save(flush:true)

         // agrego panceta a la casuela de lentejas
        component = new RecipeComponent(qty: 50)
        component.save(flush:true);

        gramos.addToComponents(component)
        panceta.addToComponents(component)
        casuelaLentejas.addToComponents(component)

        component.save(flush:true);
        gramos.save(flush:true)
        panceta.save(flush:true)
        casuelaLentejas.save(flush:true)

        // agrego tomate a la casuela de lentejas
        component = new RecipeComponent(qty: 50)
        component.save(flush:true);

        gramos.addToComponents(component)
        tomate.addToComponents(component)
        casuelaLentejas.addToComponents(component)

        component.save(flush:true);
        gramos.save(flush:true)
        tomate.save(flush:true)
        casuelaLentejas.save(flush:true)

        // agrego tomate a los fideos
        component = new RecipeComponent(qty: 50)
        component.save(flush:true);

        gramos.addToComponents(component)
        tomate.addToComponents(component)
        fideos.addToComponents(component)

        component.save(flush:true);
        gramos.save(flush:true)
        tomate.save(flush:true)
        fideos.save(flush:true)



    }
    def destroy = {
    }
}
