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
	   return (user.username == null || user.username.length() == 0 || user.password == null || user.password.length() == 0 || user.name == null || user.name.length() == 0 ||  user.surname == null || user.surname.length() == 0 || user.email == null || user.email.length() == 0) 
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
