<html>
  <head>
 <meta name="layout" content="mainadmin">
    <title>HoyQueComemos</title>
	<parameter name="recipes" value="active" />
  </head>
  <body>
      <div class="well">
		<div class="hero-unit-forms">
    		<h2>Recetas a moderar</h2>
			<g:if test="${flash.message!=null}">
				<div id="flashAlert" class="alert alert-success">${flash.message}</div>
			</g:if>
			<br>
			<table class="table table-hover">
				<thead>
					<th>Receta</th>
					<th>Creador</th>
					<th></th>
	     		</thead>
				<tbody>
  					<g:each in="${recipes}" var="recipe">
      				<tr>
						<td>${recipe.name}</td>
						<td>${recipe.user.username}</td>
						<td><a href="/moderateRecipes/edit/${recipe.id}">Moderar</a></td>
     				</tr>
  					</g:each>
				</tbody>
			</table>
				<div class="pagination-container pagination-centered">
				<g:paginate next="Siguiente" prev="Anterior"
	            	controller="moderateRecipes" action="index"  
	        		max="${max}" maxsteps="10" total="${total}" />
			</div>
		</div>
	</div>
  </body>
</html>