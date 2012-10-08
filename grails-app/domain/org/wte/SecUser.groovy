package org.wte

class SecUser {

    static hasMany = [likes:UserLikeRecipe, recipes: Recipe]

	transient springSecurityService

	String username
	String name
	String surname
	String email
	String password
    Long avatar = 1
    boolean mailPublic
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired
	Integer points

	static constraints = {
		username unique: true, blank: false, size: 1..100
		password blank: false, size: 1..100
		name blank: false, size: 1..100
		surname blank: false, size: 1..100
		email unique: true, blank: false, size: 1..100
	}
	
	boolean mustShowValidationError(){
	   return (this.username == null || this.username.trim().length() == 0 || this.password == null || this.password.trim().length() == 0 || this.name == null || this.name.trim().length() == 0 ||  this.surname == null || this.surname.trim().length() == 0 || this.email == null || this.email.trim().length() == 0) 
	}
	
	static mapping = {
		password column: '`password`'
	}

	Set<SecRole> getAuthorities() {
		SecUserSecRole.findAllBySecUser(this).collect { it.secRole } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}
}
