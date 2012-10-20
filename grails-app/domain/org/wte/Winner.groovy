package org.wte

class Winner {
	static belongsTo = [contest: Contest]
 	static hasMany = [likes: UserLikeRecipe]
	Recipe recipe;
	Integer points;
	
}