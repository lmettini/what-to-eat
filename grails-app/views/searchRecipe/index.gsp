<html>
  <head>
      <title>Buscar Recetas</title>
	  <meta name="layout" content="main">
	  <g:javascript library="wte/wte.search" />
	  <g:javascript library="wte/wte.search.widgets" />
  </head>
  <body>
	<div class="wte-container ui-widget">
		<label for="ingredient">Ingrediente: </label>
		<input id="ingredient"><a id="addIngredient" href="#">Agregar</a>
	</div>
	<div class="wte-container ui-widget" style="margin-top:2em; font-family:Arial">
		<div>Listado:</div>
		<div id="ingredientList">
		</div>
	</div>
	<div id="searchFormContainer" class="wte-container">
		<g:formRemote name="searchForm" update="recipes" url="[controller: 'searchable', action:'index']">
			<g:hiddenField id="searchableQuery" name="q" value=""/>
			<g:submitButton id="searchRecipe" name="Buscar Recetas"/>
		</g:formRemote>
	</div>
	<div id="recipes" class="wte-container">
	</div>
  </body>
</html>