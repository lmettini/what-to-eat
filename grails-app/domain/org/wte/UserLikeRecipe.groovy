package org.wte

class UserLikeRecipe {
    SecUser user
    Recipe recipe
   
 	Date dateCreated
    Date lastUpdated

    static constraints = {
        user blank:false
        recipe blank:false
    }

    static searchable = {
    }

}
