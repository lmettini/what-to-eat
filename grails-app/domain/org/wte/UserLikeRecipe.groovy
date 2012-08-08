package org.wte

class UserLikeRecipe {
    SecUser user
    Recipe recipe

    static constraints = {
        user blank:false
        recipe blank:false
    }

    static searchable = {
    }
}
