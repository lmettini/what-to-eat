package org.wte

import grails.plugins.springsecurity.Secured 
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

class UserInfoController {
	
	def springSecurityService
	def mailService
	
	def create = {
		def user = new SecUser()
		[user: user]
 	}

	def show = {
		def user = SecUser.get(params.id)
		[user: user]
 	}

    @Secured(['IS_AUTHENTICATED_FULLY'])
    def edit = {
		[user: springSecurityService.currentUser]
 	}

	def save = {
		def user = new SecUser(enabled: true, accountExpired: false, accountLocked: false, passwordExpired: false, points: 0)
		user.properties = params
		if (user.validate()){
			if (!user.password.equals(params.password2)){
				render view: 'create', model: [user: user, wrongPassword: true]
				return
			}
			if (!params.mailPublic){
				user.mailPublic = false
			}
			def pass = user.password
			def conf = SpringSecurityUtils.securityConfig
			if (user.save(flush: true)){
				mailService.sendMail {
					to user.email
					from conf.ui.register.emailFrom
					subject "HoyQueComemos - Su usuario ha sido creado"
					html view: "/email/registrationConfirmation", model:[user:user, pass: pass]
				}
			}
			springSecurityService.reauthenticate user.username
			redirect(controller: "home", action: "index")
		} else {
			boolean wrongPassword = false
			if (!user.password.equals(params.password2)){
				wrongPassword = true
			}
			render view: 'create', model: [user: user, wrongPassword: wrongPassword]
		}
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def update = {
		def user = springSecurityService.currentUser
		user.properties = params
		if (user.validate()){
			if (!user.password.equals(params.password2)){
				render view: 'edit', model: [user: user, wrongPassword: true]
				return
			}
			if (!params.mailPublic){
				user.mailPublic = false
			}
			user.save(flush: true)
			redirect(controller: "home", action: "index")
		} else {
			boolean wrongPassword = false
			if (!user.password.equals(params.password2)){
				wrongPassword = true
			}
			render view: 'edit', model: [user: user, wrongPassword: wrongPassword]
		}
	}
	
}
