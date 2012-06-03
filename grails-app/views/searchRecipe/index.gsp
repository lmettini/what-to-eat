<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
      <title>Simple GSP page</title>
	  <link type="text/css" href="css/application.css" rel="stylesheet" />
	  <link type="text/css" href="css/jquery-ui/jquery-ui-1.8.20.custom.css" rel="stylesheet" />
	  <script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script>
	  <script type="text/javascript" src="/js/jquery-ui-1.8.20.custom.min.js"></script>
	  <script type="text/javascript">					
			$(function(){		
				$( "#ingredient" ).autocomplete({
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
							$( this ).removeClass( "ui-corner-all" ).addClass( "ui-corner-top" );
						},
						close: function() {
							$( this ).removeClass( "ui-corner-top" ).addClass( "ui-corner-all" );
						}
					});
				
				$( "#addIngredient" ).button();
				$( "#addIngredient" ).click(function() { 
					$("<div/>").text($("#ingredient").val()).prependTo("#ingredientList");
					$("#ingredient").val("");
				});	
			});
	  </script>
  </head>
  <body>
	<div class="ui-widget">
		<label for="ingredient">Ingrediente: </label>
		<input id="ingredient"><a id="addIngredient" href="#">Agregar</a>
	</div>
	<div class="ui-widget" style="margin-top:2em; font-family:Arial">
		<div style="float:left">Listado:</div>
		<div id="ingredientList" style="float:left;height: 200px; width: 300px; overflow: auto;" class="ui-widget-content">
		</div>
	</div>
  </body>
</html>