<html>
  <head>
 <meta name="layout" content="main">
    <title>HoyQueComemos</title>
	<parameter name="myRecipes" value="active" />
  </head>
  <body>
   	  <div class="well">
		<div class="hero-unit-forms">

    		<h2>Mis Recetas <a href="/recipe/create"><img src="/img/insert-recipe.png" title="Agregar una nueva receta"></a></h2>
			<g:if test="${flash.message!=null}">
				<div id="flashAlert" class="alert alert-success">${flash.message}</div>
			</g:if>
  		<br>
			<table class="table table-hover">
				<thead>
					<th>Nombre</th>
					<th>Descripcion</th>
					<th></th>
					<th></th>
	     		</thead>
				<tbody>
  					<g:each in="${recipes}" var="recipe" status="i">
      				<tr>
						<td><a href="/recipe/show/${recipe.id}">${recipe.name}</a></td>
						<td>${recipe.summary}</td>
						<td><a href="/recipe/edit/${recipe.id}"><img src="/img/edit.png" title="Editar la receta"/></a></td>
						<td><a href="#deleteModal${i}" role="button" data-toggle="modal"><img src="/img/delete.png" title="Eliminar la receta"/></a></td>
     				</tr>
                    	<div id="deleteModal${i}" class="modal hide fade">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
                            <h3>¿Estás seguro de querer eliminar esta receta?</h3>
                            <br>
                          </div>
                          <div class="modal-footer">
                            <a href="/recipe/delete/${recipe.id}" class="btn btn-danger">Eliminar</a>
                            <a href="#" data-dismiss="modal" class="btn">Cancelar</a>
                          </div>

  					</g:each>
				</tbody>
			</table>
		</div>
	</div>
	<content tag="js">
		<script type="text/javascript">
			<g:if test="${flash.message!=null}">
    			$(document).ready(function() {
					$("#flashAlert").alert();
    				});
		    </g:if>
		</script>
	</content>
  </body>
</html>