class UrlMappings {
    static excludes = [ '/favicon.ico']
	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

        "/login/$action?"(controller: "login")
        "/logout/$action?"(controller: "logout")


		"/"(controller:"home")

		//"/"(view:"/index")
		"500"(view:'/error')
	}
}
