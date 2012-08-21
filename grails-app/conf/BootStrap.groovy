import org.wte.*

class BootStrap {

    def init = { servletContext ->
		
		SecUser adminuser = new SecUser(username:"admin", name: "admin", surname: "admin", email: "admin@zumos.com", password:"1234", enabled: true, accountExpired: false, accountLocked: false, passwordExpired: false, avatar: 1, mailPublic: true)
		adminuser.save(flush: true)
		SecRole adminrole = new SecRole(authority: "ROLE_ADMIN")
		adminrole.save(flush: true)
		SecUserSecRole.create(adminuser, adminrole, true)
		
		SecUser zumosuser1 = new SecUser(username:"zumos1", name: "zumos1", surname: "user1", email: "zumosuser1@zumos.com", password:"1234", enabled: true, accountExpired: false, accountLocked: false, passwordExpired: false, avatar: 1, mailPublic: true)
		SecUser zumosuser2 = new SecUser(username:"zumos2", name: "zumos2", surname: "user2", email: "zumosuser2@zumos.com", password:"1234", enabled: true, accountExpired: false, accountLocked: false, passwordExpired: false, avatar: 1, mailPublic: true)
		SecUser zumosuser3 = new SecUser(username:"zumos3", name: "zumos3", surname: "user3", email: "zumosuser3@zumos.com", password:"1234", enabled: true, accountExpired: false, accountLocked: false, passwordExpired: false, avatar: 1, mailPublic: true)
		SecUser zumosuser4 = new SecUser(username:"zumos4", name: "zumos4", surname: "user4", email: "zumosuser4@zumos.com", password:"1234", enabled: true, accountExpired: false, accountLocked: false, passwordExpired: false, avatar: 1, mailPublic: true)
		SecUser zumosuser5 = new SecUser(username:"zumos5", name: "zumos5", surname: "user5", email: "zumosuser5@zumos.com", password:"1234", enabled: true, accountExpired: false, accountLocked: false, passwordExpired: false, avatar: 1, mailPublic: true)
		zumosuser1.save(flush:true)
		zumosuser2.save(flush:true)
		zumosuser3.save(flush:true)
		zumosuser4.save(flush:true)
		zumosuser5.save(flush:true)

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

        Ingredient pollo = new Ingredient(name: "Pollo")
        pollo.save(flush:true)

        Ingredient papa = new Ingredient(name: "Papa")
        papa.save(flush:true)

        //defino categorias
        RecipeCategory platoPrincipal = new RecipeCategory(description: "plato principal")
        platoPrincipal.save(flush: true)

        RecipeCategory entrada = new RecipeCategory(description: "entrada")
        entrada.save(flush: true)

        RecipeCategory postre = new RecipeCategory(description: "postre")
        postre.save(flush: true)
		
        // defino recetas
        Recipe fideos = new Recipe(name: "Fideos con tuco", title: "Fideos con tuco", user: zumosuser1, summary:"Fideos con tuco de la nona", description: "los mejores fideos que podes probar en tu vida", video: "", points: 0, category: platoPrincipal )
        fideos.save(flush:true)

        Recipe casuelaLentejas = new Recipe(name: "Casuela de lentejas", title: "Casuela de lentejas", user: zumosuser2, summary: "Casuela de lentejas de la tia", description: "Casuela de lentejas de la tia, la mejor del condado", video: "", points: 0, category: platoPrincipal)
        casuelaLentejas.save(flush:true)

        Recipe polloPimienta = new Recipe(name: "Pollo a la pimienta", title: "Pollo a la pimienta", user: zumosuser2, summary: "Una gran y fácil receta con pollo", description: "Para hacer la receta tenes que mezclar el pollo, la panceta y la pimienta", video: "", points: 0, category: platoPrincipal)
        polloPimienta.save(flush:true)

        Recipe purePicante = new Recipe(name: "Pure picante", title: "Pure picante", user: zumosuser1, summary: "Para salir del paso y tomarte hasta el agua del inodoro", description: "Hervir papa, pisarla y agregarle pimienta", video: "", points: 0, category: platoPrincipal)
        purePicante.save(flush:true)

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

         // agrego panceta a la cazuela de lentejas
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

        // agrego pimienta a la receta de pollo a la pimienta
        component = new RecipeComponent(qty: 2)
        component.save(flush:true);

        cucharada.addToComponents(component)
        pimienta.addToComponents(component)
        polloPimienta.addToComponents(component)

        component.save(flush:true);
        cucharada.save(flush:true)
        pimienta.save(flush:true)
        polloPimienta.save(flush:true)

        // agrego panceta a la receta de pollo a la pimienta
        component = new RecipeComponent(qty: 50)
        component.save(flush:true);

        gramos.addToComponents(component)
        panceta.addToComponents(component)
        polloPimienta.addToComponents(component)

        component.save(flush:true);
        gramos.save(flush:true)
        panceta.save(flush:true)
        polloPimienta.save(flush:true)

        // agrego pimienta a la receta de pure picante
        component = new RecipeComponent(qty: 4)
        component.save(flush:true);

        cucharada.addToComponents(component)
        pimienta.addToComponents(component)
        purePicante.addToComponents(component)

        component.save(flush:true);
        cucharada.save(flush:true)
        pimienta.save(flush:true)
        purePicante.save(flush:true)

        // agrego pimienta a la receta de pure picante
        component = new RecipeComponent(qty: 4)
        component.save(flush:true);

        cucharada.addToComponents(component)
        papa.addToComponents(component)
        purePicante.addToComponents(component)

        component.save(flush:true);
        cucharada.save(flush:true)
        papa.save(flush:true)
        purePicante.save(flush:true)
    }
    def destroy = {
    }
}
