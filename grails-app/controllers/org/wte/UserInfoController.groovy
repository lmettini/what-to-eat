package org.wte

import grails.plugins.springsecurity.Secured 

class UserInfoController {
	
	def springSecurityService

	def show = {
		def user = SecUser.get(params.id)
		[user: user]
 	}

    @Secured(['IS_AUTHENTICATED_FULLY'])
    def edit = {
		[user: springSecurityService.currentUser]
 	}

    @Secured(['IS_AUTHENTICATED_FULLY'])
	def save = {
		def user = springSecurityService.currentUser
		user.properties = params
		if (user.validate()){
			if (!params.mailPublic){
				user.mailPublic = false
			}
			user.save(flush: true)
			redirect(controller: "home", action: "index")
		} else {
			forward(action:"edit")
		}
	}
}
