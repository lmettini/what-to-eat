<html>
  <head>
 <meta name="layout" content="main">
    <title>HoyQueComemos</title>
  </head>
  <body>
      <div class="well">
      		<h1>
			Recetas que encontramos para los ingredientes: 
			<g:each in="${ingredients}" var="ing" status="i"><g:if test="${i!=0}">, </g:if>${ing.name}</g:each>
			</h1>
			<br>
			<g:each in="${resultList}" var="res">
				<div class="row-fluid">
					<div class="span12 alert alert-info">
   						<h2>
							<g:if test="${res.recipe.firstImage() != null}">
								<img style="padding-right:10px" class="bs-icon" src="${res.recipe.firstImage().thumbnail}">
			  				</g:if>
							${res.recipe.name}
						</h2>
						<br>
						<p> Ingredientes: 
							<g:each in="${res.recipe.components}" var="cp" status="i">
								<g:if test="${i!=0}">, </g:if>${cp.ingredient.name}
							</g:each>
						</p>
        				<p>${res.recipe.description}</p>
						<p class="pull-left">Creador: ${res.recipe.user.username} - Votos: ${res.recipe.points}</p>
   						<p class="pull-right"><a class="btn" href="/recipe/show/${res.recipe.id}">Ver detalle »</a></p>
					</div><!--/span-->
				</div><!--/row-->
			</g:each>


		</div>
  </body>
</html>