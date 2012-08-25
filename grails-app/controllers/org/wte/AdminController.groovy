package org.wte

import grails.plugins.springsecurity.Secured 

class AdminController {

	@Secured(["hasRole('ROLE_ADMIN')"])
    def index = { }

}
