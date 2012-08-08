$(function(){	
	$.wteSearch = new Wte.Search();
	$("#ingredient").autocomplete({
			source: function( request, response ) {
				$.ajax({
					url: "/ingredient/getRelated/" + $("#ingredient").val(),
					dataType: "jsonp",
					data: {},
					success: function( data ) {
						response( $.map( data, function( item ) {
							return {label: item.name,value: item.name}
						}));
					}
				});
			},
			minLength: 2,
			open: function() {
				$(this).removeClass( "ui-corner-all" ).addClass( "ui-corner-top" );
			},
			close: function() {
				$(this).removeClass( "ui-corner-top" ).addClass( "ui-corner-all" );
			}
		});

	$("#addIngredient, #searchRecipe").button();
	$("#addIngredient").click(function() {
		if ($.wteSearch.contains($("#ingredient").val())){
			alert("Ya se encuentra agregado");
		} else {
	    	$.wteSearch.addIngredient($("#ingredient").val());	
			var closeButton = $("<span/>");
			closeButton.button({
		         	icons: {
		                primary: "ui-icon-close"
		            },
		            label: $("#ingredient").val()
				});
			closeButton.prependTo($("#ingredientList"));
			closeButton.click(function(){
					$.wteSearch.removeIngredient($(this).button("option", "label"));
					closeButton.remove();
				});
			$("#ingredient").val("");
		}
	});
	
	$("#searchRecipe").click(function() {
		$("#searchableQuery").val($.wteSearch.ingredients.join(" OR "));	
	});			
});