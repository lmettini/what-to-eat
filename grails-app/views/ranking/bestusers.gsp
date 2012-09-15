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
								<br>
								<div class="btn-group">		
								  <button class="btn disabled">Mejores ${maxbestusers} usuarios</button>
									<a class="btn" href="/ranking/allusers">Ver todos las usuarios</a>
								</div>
								<br>
								<table class="table table-hover">
									<thead>
										<th>#</th>
										<th>Nombre del usuario</th>
										<th>Votos</th>
						     		</thead>
									<tbody>
					  					<g:each status="i" in="${users}" var="user">
					      				<tr>
											<td>${i + 1}</td>
											<td><a href="/userInfo/show/${user.id}">${user.username}</a></td>
											<td>${user.points}</td>
					     				</tr>
					  					</g:each>
									</tbody>
								</table>	
			    	</div>
			  	</div>
			</div>
		</div>
	  </div>
  </body>
</html>