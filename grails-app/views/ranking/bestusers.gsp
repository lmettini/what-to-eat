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
			    	<li><a href="/ranking/bestrecipes">Recetas</a></li>
			    	<li class="active"><a href="#tab2">Usuarios</a></li>
			  	</ul>
			  	<div class="tab-content">
			    	<div class="tab-pane" id="tab1">
			    	</div>
			    	<div class="tab-pane active" id="tab2">
							<p><strong>Mejores ${maxbestusers} usuarios</strong> - <a href="/ranking/allusers">Ver todos las usuarios</a></p>
							<div class="row-fluid">
								<div class="span1">Posicion</div>
								<div class="span4">Nombre del usuario</div>
								<div class="span1">Votos</div>
					     	</div>
				  			<g:each status="i" in="${users}" var="user">
				      		<div class="row-fluid">
								<div class="span1">${i + 1}</div>
								<div class="span4"><a href="/userInfo/show/${user.id}">${user.username}</a></div>
								<div class="span1">${user.points}</div>
				     		</div>
				  			</g:each>
			    	</div>
			  	</div>
			</div>
		</div>
	  </div>
  </body>
</html>