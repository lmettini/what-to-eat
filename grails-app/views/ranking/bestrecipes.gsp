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
			      		<p><strong>Mejores ${maxbestrecipes} recetas</strong> - <a href="/ranking/allrecipes">Ver todas las recetas</a></p>
						<div class="row-fluid">
							<div class="span1">Posicion</div>
							<div class="span4">Nombre de la receta</div>
							<div class="span1">Votos</div>
				     	</div>
			  			<g:each status="i" in="${recipes}" var="recipe">
			      		<div class="row-fluid">
							<div class="span1">${i + 1}</div>
							<div class="span4"><a href="/recipe/show/${recipe.id}">${recipe.name}</a></div>
							<div class="span1">${recipe.points}</div>
			     		</div>
			  			</g:each>
			    	</div>
			    	<div class="tab-pane" id="tab2">
			    	</div>
			  	</div>
			</div>
		</div>
	  </div>
  </body>
</html>