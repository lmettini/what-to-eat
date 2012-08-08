Wte.Search = function(){
	this.ingredients = new Array();
	
	this.contains = function(ingredient){
		if (this.ingredients.indexOf(ingredient) > -1){
			return true;
		} 
		return false;
	}
	
	this.addIngredient = function(ingredient){
		this.ingredients.push(ingredient);
	}
	
	this.removeIngredient = function(ingredient){
		var index = this.ingredients.indexOf(ingredient);
		this.ingredients.splice(index, 1);
	}
}