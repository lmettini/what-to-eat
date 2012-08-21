package org.wte

class SecUser {

    static hasMany = [likes:UserLikeRecipe, recipes: Recipe]

	transient springSecurityService

	String username
	String name
	String surname
	String email
	String password
    Long avatar
    boolean mailPublic
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired
	Integer points

	static constraints = {
		username blank: false, unique: true
		password blank: false
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
