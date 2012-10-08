<html>
  <head>
 <meta name="layout" content="main">
    <title>Ver perfil de usuario</title>
  </head>  
  <div class="well">
    <div class="row-fluid">
          <div class="hero-unit-forms">
			<h1>Información de usuario</h1>
			<br>
			<div class="user-information">
            	<h2><img id="imgSelectedAavatar" src="/img/avatars/avatar${user.avatar}.png" /> ${user.username}</h2>
            	<br/>
            	<div class="row-fluid">
            		<div class="span1 bold">Nombre:</div>
                	<div class="span8">${user.name}</div>
            	</div>
            	<div class="row-fluid">
	        		<div class="span1 bold">Apellido:</div>
                	<div class="span8">${user.surname}</div>
            	</div>
				<g:if test="${user.mailPublic}">
				<div class="row-fluid">
		    		<div class="span1 bold">Email:</div>
	            	<div class="span8">${user.email}</div>
	        	</div>
				</g:if>   
			</div>
			<div class="tabbable"> <!-- Only required for left/right tabs -->
              	<ul class="nav nav-tabs user-tab">
                	<li class="active"><a id="t-1" href="#tab1" data-toggle="tab">Recetas creadas</a></li>
                	<li><a id="t-2" href="#tab2" data-toggle="tab">Recetas Votadas</a></li>
              	</ul>
              	<div class="tab-content">
                	<div class="tab-pane active" id="tab1">                    	
                        <g:each status="i" in="${user.recipes}" var="recipe">
						<div class="row-fluid">
							<div class="span12 container container-row">
           						<h2>
									<g:if test="${recipe.firstImage() != null}">
										<img style="padding-right:10px" class="bs-icon" src="${recipe.firstImage().thumbnail}">
					  				</g:if>
									${recipe.name}
								</h2>
								<br>
								<div class="alert alert-info">
									<p> Ingredientes: 
										<g:each in="${recipe.components}" var="cp" status="j">
											<g:if test="${j!=0}">, </g:if>${cp.ingredient.name}
										</g:each>
									</p>
                					<p>${recipe.description}</p>
									<p>Votos: ${recipe.points}</p>
           							<p style="text-align:right"><a class="btn btn-primary" href="/recipe/show/${recipe.id}">Ver detalle »</a></p>
								</div>
        					</div><!--/span-->
      					</div><!--/row-->
						</g:each>
                	</div>
                	<div class="tab-pane" id="tab2">
						<g:each status="i" in="${user.likes}" var="userlike">
						<div class="row-fluid">
							<div class="span12 container container-row">
           						<h2>
									<g:if test="${userlike.recipe.firstImage() != null}">
										<img style="padding-right:10px" class="bs-icon" src="${userlike.recipe.firstImage().thumbnail}">
					  				</g:if>
									${userlike.recipe.name}
								</h2>
								<br>
								<div class="alert alert-info">
									<p> Ingredientes: 
										<g:each in="${userlike.recipe.components}" var="cp" status="j">
											<g:if test="${j!=0}">, </g:if>${cp.ingredient.name}
										</g:each>
									</p>
                					<p>${userlike.recipe.description}</p>
									<p>Creador: ${userlike.recipe.user.username} - Votos: ${userlike.recipe.points}</p>
           							<p style="text-align:right"><a class="btn btn-primary" href="/recipe/show/${userlike.recipe.id}">Ver detalle »</a></p>
								</div>
        					</div><!--/span-->
      					</div><!--/row-->
			  			</g:each>
                	</div>
              	</div>
            </div>			            
		</div>
    </div>
  </div>
</body>
</html>