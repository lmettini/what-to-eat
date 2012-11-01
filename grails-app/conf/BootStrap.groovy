import org.wte.*
import grails.util.GrailsUtil;

class BootStrap {

    def init = { servletContext ->
		
        
        if(GrailsUtil.environment in ['production']){   

                // si necesitamos iniciar algo en produ




				
        } else {

            if(InetAddress.getLocalHost().getHostName()!="lmettini"){
		SecUser adminuser = new SecUser(username:"admin", name: "admin", surname: "admin", email: "admin@zumos.com", password:"1234", enabled: true, accountExpired: false, accountLocked: false, passwordExpired: false, avatar: 1, mailPublic: true, points: 0)
		adminuser.save(flush: true)
		SecRole adminrole = new SecRole(authority: "ROLE_ADMIN")
		adminrole.save(flush: true)
		SecUserSecRole.create(adminuser, adminrole, true)
		
		SecUser zumosuser1 = new SecUser(username:"zumos1", name: "zumos1", surname: "user1", email: "zumosuser1@zumos.com", password:"1234", enabled: true, accountExpired: false, accountLocked: false, passwordExpired: false, avatar: 1, mailPublic: true, points: 0)
		SecUser zumosuser2 = new SecUser(username:"zumos2", name: "zumos2", surname: "user2", email: "zumosuser2@zumos.com", password:"1234", enabled: true, accountExpired: false, accountLocked: false, passwordExpired: false, avatar: 1, mailPublic: true, points: 0)
		SecUser zumosuser3 = new SecUser(username:"zumos3", name: "zumos3", surname: "user3", email: "zumosuser3@zumos.com", password:"1234", enabled: true, accountExpired: false, accountLocked: false, passwordExpired: false, avatar: 1, mailPublic: true, points: 0)
		SecUser zumosuser4 = new SecUser(username:"zumos4", name: "zumos4", surname: "user4", email: "zumosuser4@zumos.com", password:"1234", enabled: true, accountExpired: false, accountLocked: false, passwordExpired: false, avatar: 1, mailPublic: true, points: 0)
		SecUser zumosuser5 = new SecUser(username:"zumos5", name: "zumos5", surname: "user5", email: "zumosuser5@zumos.com", password:"1234", enabled: true, accountExpired: false, accountLocked: false, passwordExpired: false, avatar: 1, mailPublic: true, points: 0)
		zumosuser1.save(flush:true)
		zumosuser2.save(flush:true)
		zumosuser3.save(flush:true)
		zumosuser4.save(flush:true)
		zumosuser5.save(flush:true)

            // defino algunas unidades de medida
                MeasureUnit centcub = new MeasureUnit(name: "Centímetros cúbicos")
                centcub.save(flush:true)

                MeasureUnit cucharada = new MeasureUnit(name: "Cucharadas")
                cucharada.save(flush:true)

                MeasureUnit gramos = new MeasureUnit(name: "Gramos")
                gramos.save(flush:true)

                MeasureUnit litros = new MeasureUnit(name: "Litros")
                litros.save(flush:true)

                MeasureUnit pizca = new MeasureUnit(name: "Pizca")
                pizca.save(flush:true)

                MeasureUnit tazas = new MeasureUnit(name: "Tazas")
                tazas.save(flush:true)

                MeasureUnit unidades = new MeasureUnit(name: "Unidades")
                unidades.save(flush:true)

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

                Ingredient azucar = new Ingredient(name: "Azucar")
                azucar.save(flush:true)

                Ingredient sal = new Ingredient(name: "Sal")
                sal.save(flush:true)

                Ingredient harina = new Ingredient(name: "Harina")
                harina.save(flush:true)

                //defino categorias
                RecipeCategory entrada = new RecipeCategory(description: "Entrada")
                entrada.save(flush: true)

                RecipeCategory sopasYCremas = new RecipeCategory(description: "Sopas y Cremas")
                sopasYCremas.save(flush: true)

                RecipeCategory ensaladas = new RecipeCategory(description: "Ensaladas")
                ensaladas.save(flush: true)

                RecipeCategory platoPrincipal = new RecipeCategory(description: "Plato Principal")
                platoPrincipal.save(flush: true)

                RecipeCategory pastasYArroces = new RecipeCategory(description: "Pastas y Arroces")
                pastasYArroces.save(flush: true)

                RecipeCategory postre = new RecipeCategory(description: "Postres")
                postre.save(flush: true)
        		
                // defino recetas
                Recipe fideos = new Recipe(name: "Fideos con tuco", title: "Fideos con tuco", user: zumosuser1, summary:"Fideos con tuco de la nona", description: "los mejores fideos que podes probar en tu vida. los mejores fideos que podes probar en tu vida. los mejores fideos que podes probar en tu vida. los mejores fideos que podes probar en tu vida. los mejores fideos que podes probar en tu vida. los mejores fideos que podes probar en tu vida. los mejores fideos que podes probar en tu vida. los mejores fideos que podes probar en tu vida. los mejores fideos que podes probar en tu vida. los mejores fideos que podes probar en tu vida. los mejores fideos que podes probar en tu vida. los mejores fideos que podes probar en tu vida. los mejores fideos que podes probar en tu vida. los mejores fideos que podes probar en tu vida. los mejores fideos que podes probar en tu vida. los mejores fideos que podes probar en tu vida. los mejores fideos que podes probar en tu vida. los mejores fideos que podes probar en tu vida. los mejores fideos que podes probar en tu vida. los mejores fideos que podes probar en tu vida. los mejores fideos que podes probar en tu vida. ", video: "", points: 0, category: platoPrincipal )
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

            Ingredient ing
ing = new Ingredient(name: 'Queso Gorgonzola');ing.save(flush:true);
ing = new Ingredient(name: 'Quinoa');ing.save(flush:true);
ing = new Ingredient(name: 'Quesos');ing.save(flush:true);
ing = new Ingredient(name: 'Hígado de pollo');ing.save(flush:true);
ing = new Ingredient(name: 'Berenjena');ing.save(flush:true);
ing = new Ingredient(name: 'Zamburiñas');ing.save(flush:true);
ing = new Ingredient(name: 'Masa filo');ing.save(flush:true);
ing = new Ingredient(name: 'Udon');ing.save(flush:true);
ing = new Ingredient(name: 'Caballa');ing.save(flush:true);
ing = new Ingredient(name: 'Ají');ing.save(flush:true);
ing = new Ingredient(name: 'Galletas decoradas');ing.save(flush:true);
ing = new Ingredient(name: 'Harissa');ing.save(flush:true);
ing = new Ingredient(name: 'Shichimi togarashi');ing.save(flush:true);
ing = new Ingredient(name: 'Gula');ing.save(flush:true);
ing = new Ingredient(name: 'Queso Camembert');ing.save(flush:true);
ing = new Ingredient(name: 'Sardinas');ing.save(flush:true);
ing = new Ingredient(name: 'Tomates cherry');ing.save(flush:true);
ing = new Ingredient(name: 'Sal');ing.save(flush:true);
ing = new Ingredient(name: 'Espárragos');ing.save(flush:true);
ing = new Ingredient(name: 'Pavo');ing.save(flush:true);
ing = new Ingredient(name: 'Rulo de cabra');ing.save(flush:true);
ing = new Ingredient(name: 'Queso crema');ing.save(flush:true);
ing = new Ingredient(name: 'Gelatina');ing.save(flush:true);
ing = new Ingredient(name: 'Tomillo');ing.save(flush:true);
ing = new Ingredient(name: 'Salmonetes');ing.save(flush:true);
ing = new Ingredient(name: 'Langosta');ing.save(flush:true);
ing = new Ingredient(name: 'Pimientos del piquillo');ing.save(flush:true);
ing = new Ingredient(name: 'Coles de Bruselas');ing.save(flush:true);
ing = new Ingredient(name: 'Solomillo de Ternera');ing.save(flush:true);
ing = new Ingredient(name: 'Buey de Kobe');ing.save(flush:true);
ing = new Ingredient(name: 'Guindillas');ing.save(flush:true);
ing = new Ingredient(name: 'Rúcula');ing.save(flush:true);
ing = new Ingredient(name: 'Pimientos de Padrón');ing.save(flush:true);
ing = new Ingredient(name: 'Queso Cheddar');ing.save(flush:true);
ing = new Ingredient(name: 'Alubias de Tolosa');ing.save(flush:true);
ing = new Ingredient(name: 'Sésamo');ing.save(flush:true);
ing = new Ingredient(name: 'Tofu');ing.save(flush:true);
ing = new Ingredient(name: 'Vainilla');ing.save(flush:true);
ing = new Ingredient(name: 'Queso');ing.save(flush:true);
ing = new Ingredient(name: 'Ciruelas pasas');ing.save(flush:true);
ing = new Ingredient(name: 'Ron');ing.save(flush:true);
ing = new Ingredient(name: 'Flores comestibles');ing.save(flush:true);
ing = new Ingredient(name: 'Frambuesas');ing.save(flush:true);
ing = new Ingredient(name: 'Mermelada de tomate');ing.save(flush:true);
ing = new Ingredient(name: 'Cacao');ing.save(flush:true);
ing = new Ingredient(name: 'Brie');ing.save(flush:true);
ing = new Ingredient(name: 'Harina de soja');ing.save(flush:true);
ing = new Ingredient(name: 'Manzanas Reineta');ing.save(flush:true);
ing = new Ingredient(name: 'Ventresca');ing.save(flush:true);
ing = new Ingredient(name: 'Cogollos de lechuga');ing.save(flush:true);
ing = new Ingredient(name: 'Lombarda');ing.save(flush:true);
ing = new Ingredient(name: 'Guisantes');ing.save(flush:true);
ing = new Ingredient(name: 'Caviar');ing.save(flush:true);
ing = new Ingredient(name: 'Queso Feta');ing.save(flush:true);
ing = new Ingredient(name: 'Codornices');ing.save(flush:true);
ing = new Ingredient(name: 'Brandy');ing.save(flush:true);
ing = new Ingredient(name: 'Esencia de Menta');ing.save(flush:true);
ing = new Ingredient(name: 'Pasta Brik');ing.save(flush:true);
ing = new Ingredient(name: 'Berros');ing.save(flush:true);
ing = new Ingredient(name: 'Pez espada');ing.save(flush:true);
ing = new Ingredient(name: 'Apio');ing.save(flush:true);
ing = new Ingredient(name: 'Vinagre de Jerez');ing.save(flush:true);
ing = new Ingredient(name: 'Vieiras');ing.save(flush:true);
ing = new Ingredient(name: 'Pepino');ing.save(flush:true);
ing = new Ingredient(name: 'Gallos');ing.save(flush:true);
ing = new Ingredient(name: 'Queso Arzúa Ulloa');ing.save(flush:true);
ing = new Ingredient(name: 'Avena');ing.save(flush:true);
ing = new Ingredient(name: 'Platerina');ing.save(flush:true);
ing = new Ingredient(name: 'Salsa al pesto');ing.save(flush:true);
ing = new Ingredient(name: 'Pimienta de Jamaica');ing.save(flush:true);
ing = new Ingredient(name: 'Chile thai');ing.save(flush:true);
ing = new Ingredient(name: 'Leche sin lactosa');ing.save(flush:true);
ing = new Ingredient(name: 'Agar agar');ing.save(flush:true);
ing = new Ingredient(name: 'Fruta de la pasión');ing.save(flush:true);
ing = new Ingredient(name: 'Mango');ing.save(flush:true);
ing = new Ingredient(name: 'Cardamomo');ing.save(flush:true);
ing = new Ingredient(name: 'Batatas');ing.save(flush:true);
ing = new Ingredient(name: 'Judiones');ing.save(flush:true);
ing = new Ingredient(name: 'Oporto');ing.save(flush:true);
ing = new Ingredient(name: 'Vinagre');ing.save(flush:true);
ing = new Ingredient(name: 'Pistachos');ing.save(flush:true);
ing = new Ingredient(name: 'Champiñón');ing.save(flush:true);
ing = new Ingredient(name: 'Anacardos');ing.save(flush:true);
ing = new Ingredient(name: 'Presa');ing.save(flush:true);
ing = new Ingredient(name: 'Yuca');ing.save(flush:true);
ing = new Ingredient(name: 'Litchi');ing.save(flush:true);
ing = new Ingredient(name: 'Lechazo');ing.save(flush:true);
ing = new Ingredient(name: 'Hinojo');ing.save(flush:true);
ing = new Ingredient(name: 'Rábano');ing.save(flush:true);
ing = new Ingredient(name: 'Ginebra');ing.save(flush:true);
ing = new Ingredient(name: 'Chufa');ing.save(flush:true);
ing = new Ingredient(name: 'Vino blanco');ing.save(flush:true);
ing = new Ingredient(name: 'Longanizas frescas');ing.save(flush:true);
ing = new Ingredient(name: 'Queso Edam');ing.save(flush:true);
ing = new Ingredient(name: 'Vino dulce');ing.save(flush:true);
ing = new Ingredient(name: 'Churrasco');ing.save(flush:true);
ing = new Ingredient(name: 'Galeras');ing.save(flush:true);
ing = new Ingredient(name: 'Arroz bomba');ing.save(flush:true);
ing = new Ingredient(name: 'Garam masala');ing.save(flush:true);
ing = new Ingredient(name: 'Cigalas');ing.save(flush:true);
ing = new Ingredient(name: 'Chocolate negro');ing.save(flush:true);
ing = new Ingredient(name: 'Afuega´l Pitu');ing.save(flush:true);
ing = new Ingredient(name: 'Panko');ing.save(flush:true);
ing = new Ingredient(name: 'Pluma ibérica');ing.save(flush:true);
ing = new Ingredient(name: 'Pasta de curry');ing.save(flush:true);
ing = new Ingredient(name: 'Fideos Udon');ing.save(flush:true);
ing = new Ingredient(name: 'leche condensada');ing.save(flush:true);
ing = new Ingredient(name: 'Pepinillos');ing.save(flush:true);
ing = new Ingredient(name: 'Mirin');ing.save(flush:true);
ing = new Ingredient(name: 'Surimi');ing.save(flush:true);
ing = new Ingredient(name: 'Aceite de girasol');ing.save(flush:true);
ing = new Ingredient(name: 'Queso Quark');ing.save(flush:true);
ing = new Ingredient(name: 'Picantones');ing.save(flush:true);
ing = new Ingredient(name: 'Perdiz');ing.save(flush:true);
ing = new Ingredient(name: 'Arandanos');ing.save(flush:true);
ing = new Ingredient(name: 'Obulato');ing.save(flush:true);
ing = new Ingredient(name: 'Ghee');ing.save(flush:true);
ing = new Ingredient(name: 'Salvia');ing.save(flush:true);
ing = new Ingredient(name: 'Burrata');ing.save(flush:true);
ing = new Ingredient(name: 'Cebolleta');ing.save(flush:true);
ing = new Ingredient(name: 'Kumato');ing.save(flush:true);
ing = new Ingredient(name: 'Salsa Barbacoa');ing.save(flush:true);
ing = new Ingredient(name: 'Ciruelas Umeboshi');ing.save(flush:true);
ing = new Ingredient(name: 'Aceite de Argán');ing.save(flush:true);
ing = new Ingredient(name: 'Cecina');ing.save(flush:true);
ing = new Ingredient(name: 'Alubias Azuki');ing.save(flush:true);
ing = new Ingredient(name: 'Buey');ing.save(flush:true);
ing = new Ingredient(name: 'Kalonji');ing.save(flush:true);
ing = new Ingredient(name: 'Edamame');ing.save(flush:true);
ing = new Ingredient(name: 'Clóchinas');ing.save(flush:true);
ing = new Ingredient(name: 'Torta del Casar');ing.save(flush:true);
ing = new Ingredient(name: 'Arroz Venere');ing.save(flush:true);
ing = new Ingredient(name: 'Levadura de panadería');ing.save(flush:true);
ing = new Ingredient(name: 'Margarina');ing.save(flush:true);
ing = new Ingredient(name: 'Queso de Servilleta');ing.save(flush:true);
ing = new Ingredient(name: 'Acelgas');ing.save(flush:true);
ing = new Ingredient(name: 'Manzanas');ing.save(flush:true);
ing = new Ingredient(name: 'Ras el hanout');ing.save(flush:true);
ing = new Ingredient(name: 'Arrope');ing.save(flush:true);
ing = new Ingredient(name: 'Roquefort');ing.save(flush:true);
ing = new Ingredient(name: 'Granadilla');ing.save(flush:true);
ing = new Ingredient(name: 'Boniato');ing.save(flush:true);
ing = new Ingredient(name: 'Aceitunas Negras');ing.save(flush:true);
ing = new Ingredient(name: 'Berberechos');ing.save(flush:true);
ing = new Ingredient(name: 'Roast Beef');ing.save(flush:true);
ing = new Ingredient(name: 'Comino');ing.save(flush:true);
ing = new Ingredient(name: 'Gorgonzola');ing.save(flush:true);
ing = new Ingredient(name: 'Níscalos');ing.save(flush:true);
ing = new Ingredient(name: 'Azahar');ing.save(flush:true);
ing = new Ingredient(name: 'Queso Emmental');ing.save(flush:true);
ing = new Ingredient(name: 'Queso de Mahón');ing.save(flush:true);
ing = new Ingredient(name: 'Salami');ing.save(flush:true);
ing = new Ingredient(name: 'Jamón Ibérico');ing.save(flush:true);
ing = new Ingredient(name: 'Ossobuco');ing.save(flush:true);
ing = new Ingredient(name: 'Guayaba');ing.save(flush:true);
ing = new Ingredient(name: 'Alitas de pollo');ing.save(flush:true);
ing = new Ingredient(name: 'Azúcar moreno');ing.save(flush:true);
ing = new Ingredient(name: 'Wasabi');ing.save(flush:true);
ing = new Ingredient(name: 'Cerdo ibérico');ing.save(flush:true);
ing = new Ingredient(name: 'Queso Havarti');ing.save(flush:true);
ing = new Ingredient(name: 'Yogur Griego');ing.save(flush:true);
ing = new Ingredient(name: 'Calabazate');ing.save(flush:true);
ing = new Ingredient(name: 'Arroz de sushi');ing.save(flush:true);
ing = new Ingredient(name: 'Pasta filo');ing.save(flush:true);
ing = new Ingredient(name: 'Bourbon');ing.save(flush:true);
ing = new Ingredient(name: 'Jamón de pato');ing.save(flush:true);
ing = new Ingredient(name: 'Fideos');ing.save(flush:true);
ing = new Ingredient(name: 'Nuez de Macadamia');ing.save(flush:true);
ing = new Ingredient(name: 'Salsa de soja');ing.save(flush:true);
ing = new Ingredient(name: 'Leche de coco');ing.save(flush:true);
ing = new Ingredient(name: 'Papel de arroz');ing.save(flush:true);
ing = new Ingredient(name: 'Cebolla roja');ing.save(flush:true);
ing = new Ingredient(name: 'Cebollino');ing.save(flush:true);
ing = new Ingredient(name: 'Percebes');ing.save(flush:true);
ing = new Ingredient(name: 'Harina de centeno');ing.save(flush:true);
ing = new Ingredient(name: 'Vinagre de arroz');ing.save(flush:true);
ing = new Ingredient(name: 'Filetes de ternera');ing.save(flush:true);
ing = new Ingredient(name: 'Queso Gruyère');ing.save(flush:true);
ing = new Ingredient(name: 'Miso');ing.save(flush:true);
ing = new Ingredient(name: 'Pimientos de Herbón');ing.save(flush:true);
ing = new Ingredient(name: 'Macarrones');ing.save(flush:true);
ing = new Ingredient(name: 'Alga Nori');ing.save(flush:true);
ing = new Ingredient(name: 'Fusilli');ing.save(flush:true);
ing = new Ingredient(name: 'Bogavante');ing.save(flush:true);
ing = new Ingredient(name: 'Rabo de ternera');ing.save(flush:true);
ing = new Ingredient(name: 'Judías verdes');ing.save(flush:true);
ing = new Ingredient(name: 'Lentejas rojas');ing.save(flush:true);
ing = new Ingredient(name: 'Butifarra blanca');ing.save(flush:true);
ing = new Ingredient(name: 'Aceite de oliva extra virgen');ing.save(flush:true);
ing = new Ingredient(name: 'Limón');ing.save(flush:true);
ing = new Ingredient(name: 'Bacon');ing.save(flush:true);
ing = new Ingredient(name: 'Queso de cabra');ing.save(flush:true);
ing = new Ingredient(name: 'Naranjas');ing.save(flush:true);
ing = new Ingredient(name: 'Melón');ing.save(flush:true);
ing = new Ingredient(name: 'Calabaza');ing.save(flush:true);
ing = new Ingredient(name: 'Mejillones');ing.save(flush:true);
ing = new Ingredient(name: 'Merluza');ing.save(flush:true);
ing = new Ingredient(name: 'Canela');ing.save(flush:true);
ing = new Ingredient(name: 'Curry');ing.save(flush:true);
ing = new Ingredient(name: 'Espinacas');ing.save(flush:true);
ing = new Ingredient(name: 'Calamares');ing.save(flush:true);
ing = new Ingredient(name: 'Piña');ing.save(flush:true);
ing = new Ingredient(name: 'Soja');ing.save(flush:true);
ing = new Ingredient(name: 'Morcilla');ing.save(flush:true);
ing = new Ingredient(name: 'Gambas');ing.save(flush:true);
ing = new Ingredient(name: 'Coca Cola');ing.save(flush:true);
ing = new Ingredient(name: 'Zanahoria');ing.save(flush:true);
ing = new Ingredient(name: 'Lechuga');ing.save(flush:true);
ing = new Ingredient(name: 'Puerros');ing.save(flush:true);
ing = new Ingredient(name: 'Lubina');ing.save(flush:true);
ing = new Ingredient(name: 'Sandía');ing.save(flush:true);
ing = new Ingredient(name: 'Chocolate');ing.save(flush:true);
ing = new Ingredient(name: 'Pan');ing.save(flush:true);
ing = new Ingredient(name: 'Patatas');ing.save(flush:true);
ing = new Ingredient(name: 'Arroz');ing.save(flush:true);
ing = new Ingredient(name: 'Café');ing.save(flush:true);
ing = new Ingredient(name: 'Aceite de oliva');ing.save(flush:true);
ing = new Ingredient(name: 'Tomates');ing.save(flush:true);
ing = new Ingredient(name: 'Vino');ing.save(flush:true);
ing = new Ingredient(name: 'Pollo');ing.save(flush:true);
ing = new Ingredient(name: 'Cebolla');ing.save(flush:true);
ing = new Ingredient(name: 'Pasta');ing.save(flush:true);
ing = new Ingredient(name: 'Salmón');ing.save(flush:true);
ing = new Ingredient(name: 'Jamón');ing.save(flush:true);
ing = new Ingredient(name: 'Huevos');ing.save(flush:true);
ing = new Ingredient(name: 'Moscatel');ing.save(flush:true);
ing = new Ingredient(name: 'Verdinas');ing.save(flush:true);
ing = new Ingredient(name: 'Romero');ing.save(flush:true);
ing = new Ingredient(name: 'Rape');ing.save(flush:true);
ing = new Ingredient(name: 'Orégano');ing.save(flush:true);
ing = new Ingredient(name: 'Fresones');ing.save(flush:true);
ing = new Ingredient(name: 'Jamón York');ing.save(flush:true);
ing = new Ingredient(name: 'Col');ing.save(flush:true);
ing = new Ingredient(name: 'Nuez moscada');ing.save(flush:true);
ing = new Ingredient(name: 'Queso Mascarpone');ing.save(flush:true);
ing = new Ingredient(name: 'Alcaparras');ing.save(flush:true);
ing = new Ingredient(name: 'Perejil');ing.save(flush:true);
ing = new Ingredient(name: 'Chocolate blanco');ing.save(flush:true);
ing = new Ingredient(name: 'Albaricoque');ing.save(flush:true);
ing = new Ingredient(name: 'Ajos');ing.save(flush:true);
ing = new Ingredient(name: 'Galletas');ing.save(flush:true);
ing = new Ingredient(name: 'Leche');ing.save(flush:true);
ing = new Ingredient(name: 'Champiñones');ing.save(flush:true);
ing = new Ingredient(name: 'Langostinos');ing.save(flush:true);
ing = new Ingredient(name: 'Yogurt');ing.save(flush:true);
ing = new Ingredient(name: 'Mozzarella');ing.save(flush:true);
ing = new Ingredient(name: 'Albahaca');ing.save(flush:true);
ing = new Ingredient(name: 'Atún');ing.save(flush:true);
ing = new Ingredient(name: 'Pulpo');ing.save(flush:true);
ing = new Ingredient(name: 'Miel');ing.save(flush:true);
ing = new Ingredient(name: 'Espaguetis');ing.save(flush:true);
ing = new Ingredient(name: 'Arroz glutinoso');ing.save(flush:true);
ing = new Ingredient(name: 'Calabacines');ing.save(flush:true);
ing = new Ingredient(name: 'Arroz Basmati');ing.save(flush:true);
ing = new Ingredient(name: 'Oro');ing.save(flush:true);
ing = new Ingredient(name: 'Manteca de cerdo');ing.save(flush:true);
ing = new Ingredient(name: 'Secreto ibérico');ing.save(flush:true);
ing = new Ingredient(name: 'Provolone');ing.save(flush:true);
ing = new Ingredient(name: 'Shiitakes');ing.save(flush:true);
ing = new Ingredient(name: 'Requesón');ing.save(flush:true);
ing = new Ingredient(name: 'Harina integral');ing.save(flush:true);
ing = new Ingredient(name: 'Alubias');ing.save(flush:true);
ing = new Ingredient(name: 'Rambután');ing.save(flush:true);
ing = new Ingredient(name: 'Carabineros');ing.save(flush:true);
ing = new Ingredient(name: 'Membrillo');ing.save(flush:true);
ing = new Ingredient(name: 'Vodka');ing.save(flush:true);
ing = new Ingredient(name: 'Moras');ing.save(flush:true);
ing = new Ingredient(name: 'Queso Parmesano');ing.save(flush:true);
ing = new Ingredient(name: 'Castañas');ing.save(flush:true);
ing = new Ingredient(name: 'Salchichas');ing.save(flush:true);
ing = new Ingredient(name: 'Menta');ing.save(flush:true);
ing = new Ingredient(name: 'Rabo de Buey');ing.save(flush:true);
ing = new Ingredient(name: 'Repollo');ing.save(flush:true);
ing = new Ingredient(name: 'Pasas');ing.save(flush:true);
ing = new Ingredient(name: 'Bayas del Goji');ing.save(flush:true);
ing = new Ingredient(name: 'Magret');ing.save(flush:true);
ing = new Ingredient(name: 'Sidra natural');ing.save(flush:true);
ing = new Ingredient(name: 'Azúcar glasé');ing.save(flush:true);
ing = new Ingredient(name: 'Ciruelas');ing.save(flush:true);
ing = new Ingredient(name: 'Judías blancas');ing.save(flush:true);
ing = new Ingredient(name: 'Chistorra');ing.save(flush:true);
ing = new Ingredient(name: 'Huevos de codorniz');ing.save(flush:true);
ing = new Ingredient(name: 'Empanadas');ing.save(flush:true);
ing = new Ingredient(name: 'Gurullos');ing.save(flush:true);
ing = new Ingredient(name: 'Corn flakes');ing.save(flush:true);
ing = new Ingredient(name: 'Coliflor');ing.save(flush:true);
ing = new Ingredient(name: 'Rodaballo');ing.save(flush:true);
ing = new Ingredient(name: 'Cerveza');ing.save(flush:true);
ing = new Ingredient(name: 'Bacalao');ing.save(flush:true);
ing = new Ingredient(name: 'Pimientos');ing.save(flush:true);
ing = new Ingredient(name: 'Ternera');ing.save(flush:true);
ing = new Ingredient(name: 'Cerdo');ing.save(flush:true);
ing = new Ingredient(name: 'Brócoli');ing.save(flush:true);
ing = new Ingredient(name: 'Fresa');ing.save(flush:true);
ing = new Ingredient(name: 'Anchoa');ing.save(flush:true);
ing = new Ingredient(name: 'Parmesano');ing.save(flush:true);
ing = new Ingredient(name: 'Nueces');ing.save(flush:true);
ing = new Ingredient(name: 'Plátano');ing.save(flush:true);
ing = new Ingredient(name: 'Alcachofa');ing.save(flush:true);
ing = new Ingredient(name: 'Almendras');ing.save(flush:true);
ing = new Ingredient(name: 'Setas');ing.save(flush:true);
ing = new Ingredient(name: 'Garbanzos');ing.save(flush:true);
ing = new Ingredient(name: 'Cordero');ing.save(flush:true);
ing = new Ingredient(name: 'Salmón ahumado');ing.save(flush:true);
ing = new Ingredient(name: 'Queso fresco');ing.save(flush:true);
ing = new Ingredient(name: 'Foie');ing.save(flush:true);
ing = new Ingredient(name: 'Chorizo');ing.save(flush:true);
ing = new Ingredient(name: 'Mantequilla');ing.save(flush:true);
ing = new Ingredient(name: 'Coco');ing.save(flush:true);
ing = new Ingredient(name: 'Mostaza');ing.save(flush:true);
ing = new Ingredient(name: 'Té verde');ing.save(flush:true);
ing = new Ingredient(name: 'Mandarina');ing.save(flush:true);
ing = new Ingredient(name: 'Aguacate');ing.save(flush:true);
ing = new Ingredient(name: 'Berenjenas');ing.save(flush:true);
ing = new Ingredient(name: 'Boletus');ing.save(flush:true);
ing = new Ingredient(name: 'Aceitunas');ing.save(flush:true);
ing = new Ingredient(name: 'Cous cous');ing.save(flush:true);
ing = new Ingredient(name: 'Champagne');ing.save(flush:true);
ing = new Ingredient(name: 'Nata');ing.save(flush:true);
ing = new Ingredient(name: 'Queso de Idiazabal');ing.save(flush:true);
ing = new Ingredient(name: 'Virutas de chocolate');ing.save(flush:true);
ing = new Ingredient(name: 'Melocotón');ing.save(flush:true);
ing = new Ingredient(name: 'Queso Gouda');ing.save(flush:true);
ing = new Ingredient(name: 'Avellanas');ing.save(flush:true);
ing = new Ingredient(name: 'Trufa');ing.save(flush:true);
ing = new Ingredient(name: 'Queso azul');ing.save(flush:true);
ing = new Ingredient(name: 'Jengibre');ing.save(flush:true);
ing = new Ingredient(name: 'Cerezas');ing.save(flush:true);
ing = new Ingredient(name: 'Costillas de cerdo');ing.save(flush:true);
ing = new Ingredient(name: 'Sobrasada');ing.save(flush:true);
ing = new Ingredient(name: 'Cilantro');ing.save(flush:true);
ing = new Ingredient(name: 'Lomo de cerdo');ing.save(flush:true);
ing = new Ingredient(name: 'Habas');ing.save(flush:true);
ing = new Ingredient(name: 'Maíz');ing.save(flush:true);
ing = new Ingredient(name: 'Uvas');ing.save(flush:true);
ing = new Ingredient(name: 'Azafrán');ing.save(flush:true);
ing = new Ingredient(name: 'Caramelo');ing.save(flush:true);
ing = new Ingredient(name: 'Cava');ing.save(flush:true);
ing = new Ingredient(name: 'Pimentón');ing.save(flush:true);
ing = new Ingredient(name: 'Conejo');ing.save(flush:true);
ing = new Ingredient(name: 'Almejas');ing.save(flush:true);
ing = new Ingredient(name: 'Espárragos Verdes');ing.save(flush:true);
ing = new Ingredient(name: 'Sepia');ing.save(flush:true);
ing = new Ingredient(name: 'Vinagre de Módena');ing.save(flush:true);
ing = new Ingredient(name: 'Chipirones');ing.save(flush:true);
ing = new Ingredient(name: 'Granada');ing.save(flush:true);
ing = new Ingredient(name: 'Endivias');ing.save(flush:true);
ing = new Ingredient(name: 'Harina de Fuerza');ing.save(flush:true);
ing = new Ingredient(name: 'Noodles');ing.save(flush:true);
ing = new Ingredient(name: 'Piñones');ing.save(flush:true);
ing = new Ingredient(name: 'Nata montada');ing.save(flush:true);
ing = new Ingredient(name: 'Pedro Ximénez');ing.save(flush:true);
ing = new Ingredient(name: 'Nectarinas');ing.save(flush:true);
ing = new Ingredient(name: 'Anís');ing.save(flush:true);
ing = new Ingredient(name: 'Harina Recia');ing.save(flush:true);
ing = new Ingredient(name: 'Lima');ing.save(flush:true);
ing = new Ingredient(name: 'Nabo');ing.save(flush:true);
ing = new Ingredient(name: 'Jerez');ing.save(flush:true);
ing = new Ingredient(name: 'Canónigos');ing.save(flush:true);
ing = new Ingredient(name: 'Levadura instantánea');ing.save(flush:true);
ing = new Ingredient(name: 'Solomillo de cerdo');ing.save(flush:true);
ing = new Ingredient(name: 'Papaya');ing.save(flush:true);
ing = new Ingredient(name: 'Hierbabuena');ing.save(flush:true);
ing = new Ingredient(name: 'Pato');ing.save(flush:true);
ing = new Ingredient(name: 'Cardo Rojo de Ágreda');ing.save(flush:true);
ing = new Ingredient(name: 'Dorada');ing.save(flush:true);
ing = new Ingredient(name: 'Bonito');ing.save(flush:true);
ing = new Ingredient(name: 'Pera');ing.save(flush:true);
ing = new Ingredient(name: 'Hojaldre');ing.save(flush:true);
        
        }      }

    }
    def destroy = {
    }
}
