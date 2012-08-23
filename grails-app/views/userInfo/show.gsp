<html>
  <head>
 <meta name="layout" content="main">
    <title>Ver perfil de usuario</title>
  </head>  
  <div class="well">
    <div class="row-fluid">
          <div class="hero-unit-forms">
			<div>
            	<h2>${user.username}</h2>
            	<br/>
            	<div class="row-fluid">
            		<div class="span1">Nombre</div>
                	<div class="span8">${user.name}</div>
            	</div>
            	<div class="row-fluid">
	        		<div class="span1">Apellido</div>
                	<div class="span8">${user.surname}</div>
            	</div>
				<g:if test="${user.mailPublic}">
				<div class="row-fluid">
		    		<div class="span1">Email</div>
	            	<div class="span8">${user.email}</div>
	        	</div>
				</g:if>   
			</div>
			<div class="tabbable"> <!-- Only required for left/right tabs -->
              	<ul class="nav nav-tabs">
                	<li class="active"><a id="t-1" href="#tab1" data-toggle="tab">Recetas creadas</a></li>
                	<li><a id="t-2" href="#tab2" data-toggle="tab">Recetas Votadas</a></li>
              	</ul>
              	<div class="tab-content">
                	<div class="tab-pane active" id="tab1">                    	
                        <g:each status="i" in="${user.recipes}" var="recipe">
			      		<div class="row-fluid">
							<div class="span4"><a href="/recipe/show/${recipe.id}">${recipe.name}</a></div>
			     		</div>
			  			</g:each>
                	</div>
                	<div class="tab-pane" id="tab2">
						<g:each status="i" in="${user.likes}" var="userlike">
			      		<div class="row-fluid">
							<div class="span4"><a href="/recipe/show/${userlike.recipe.id}">${userlike.recipe.name}</a></div>
			     		</div>
			  			</g:each>
                	</div>
              	</div>
            </div>			            
		</div>
    </div>
  </div>
</body>
</html>