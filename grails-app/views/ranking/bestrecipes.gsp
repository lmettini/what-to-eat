<html>
  <head>
 	<meta name="layout" content="main">
    <title>Ranking</title>
 	<parameter name="ranking" value="active" />
  </head>
  <body>
      <div class="well">
		<div class="hero-unit-forms">
			<div class="tabbable"> <!-- Only required for left/right tabs -->
			  	<ul class="nav nav-tabs">
			    	<li class="active"><a href="#tab1">Recetas</a></li>
			    	<li><a href="/ranking/bestusers">Usuarios</a></li>
			  	</ul>
			  	<div class="tab-content">
			    	<div class="tab-pane active" id="tab1">
						<br>
						<div class="btn-group">		
						  <button class="btn btn-primary disabled">Mejores ${maxbestrecipes} recetas</button>
							<a class="btn btn-primary" href="/ranking/allrecipes">Ver todas las recetas</a>
						</div>
						<br>
				
							<table class="table table-hover">
								<thead>
									<th>#</th>
									<th>Nombre de la receta</th>
									<th>Votos</th>
					     		</thead>
								<tbody>
				  					<g:each status="i" in="${recipes}" var="recipe">
				      				<tr>
										<td>${i + 1}</td>
										<td><a href="/recipe/show/${recipe.id}">${recipe.name}</a></td>
										<td>${recipe.points}</td>
				     				</tr>
				  					</g:each>
								</tbody>
							</table>
			    	</div>
			    	<div class="tab-pane" id="tab2">
			    	</div>
			  	</div>
			</div>
		</div>
	  </div>
  </body>
</html>