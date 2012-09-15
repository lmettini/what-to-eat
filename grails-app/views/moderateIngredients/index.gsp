<html>
  <head>
 <meta name="layout" content="mainadmin">
    <title>HoyQueComemos</title>
	<parameter name="ingredients" value="active" />
  </head>
  <body>
      <div class="well">
		<div class="hero-unit-forms">
    		<h2>Ingredientes a moderar</h2>
			<g:if test="${flash.message!=null}">
				<div id="flashAlert" class="alert alert-success">${flash.message}</div>
			</g:if>
			<br>
			<table class="table table-hover">
				<thead>
					<th>Ingrediente</th>
					<th>Creador</th>
					<th></th>
	     		</thead>
				<tbody>
  					<g:each in="${ingredients}" var="ingredient">
      				<tr>
						<td>${ingredient.name}</td>
						<td>${ingredient.creator.username}</td>
						<td><a href="/moderateIngredients/edit/${ingredient.id}">Moderar</a></td>
     				</tr>
  					</g:each>
				</tbody>
			</table>
				<div class="pagination-container pagination-centered">
				<g:paginate next="Siguiente" prev="Anterior"
	            	controller="moderateIngredients" action="index"  
	        		max="${max}" maxsteps="10" total="${total}" />
			</div>
		</div>
	</div>
  </body>
</html>