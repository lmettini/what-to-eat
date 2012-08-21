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
			    	<li class="active"><a href="#tab1" data-toggle="tab">Recetas</a></li>
			    	<li><a href="/ranking/bestusers" data-toggle="tab">Usuarios</a></li>
			  	</ul>
			  	<div class="tab-content">
			    	<div class="tab-pane active" id="tab1">
			      		<p><a href="/ranking/bestrecipes">Mejores 10 recetas</a> - <strong>Ver todas las recetas</strong></p>
						<div class="row-fluid">
							<div class="span1">Posicion</div>
							<div class="span4">Nombre de la receta</div>
							<div class="span1">Votos</div>
				     	</div>
			  			<g:each status="i" in="${recipes}" var="recipe">
			      		<div class="row-fluid">
							<div class="span1">${offset + i + 1}</div>
							<div class="span4"><a href="/recipe/show/${recipe.id}">${recipe.name}</a></div>
							<div class="span1">${recipe.points}</div>
			     		</div>
			  			</g:each>
						<div class="pagination-container">
								<g:paginate next="Siguiente" prev="Anterior"
						            controller="ranking" action="allrecipes"    
						        max="${max}" maxsteps="10" total="${total}" />
						</div>
			    	</div>
			    	<div class="tab-pane" id="tab2">
			    	</div>
			  	</div>
			</div>
		</div>
	  </div>
  </body>
</html>