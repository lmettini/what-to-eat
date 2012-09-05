<html>
<head>
    <meta name="layout" content="main">
    <title>HoyQueComemos</title>
</head>
<body>
<div class="well">
    <div class="row-fluid">
        <form class="form-horizontal wte-form">
            <div class="hero-unit-forms">
                <h2>${recipe.name}</h2>
				<g:if test="${flash.message!=null}">
					<div id="flashAlert" class="alert alert-success">${flash.message}</div>
				</g:if>
                <br/>
                <label><strong>Resumen</strong></label>
                <h3>${recipe.summary}</h3>
                <br/>
                <label><h2>Acá va la foto</h2></label>
				<br/>
				 <div id="recipe-description">
		        	<label><strong>Autor</strong></label>
					<span>${recipe.user.username}</span>
				</div>
                <br/>
                <label><strong>Ingredientes</strong></label>
                <div id="ingredients-list">
                <ul>
                    <g:each in="${recipeComponents}" var="comp">
                        <div class="ingredient-row">
                            <div class="alert token-ingredient">${comp.qty} ${comp.unit.name}  ${comp.ingredient.name}</div>
                        </div>
                    </g:each>
                </ul>
                </div>
                <div id="recipe-description">
                    <label><strong>Pasos a seguir</strong></label>
                    <span>${recipe.description}</span>
                </div>
				 <br/>
				<div>
					<span>
						Cantidad de votos:
						<g:if test="${recipe.points == 0}">
							${recipe.points}
						</g:if>
						<g:else>
					     	<a href="#likeUsersModal" role="button" class="btn" data-toggle="modal">${recipe.points}</a>
						</g:else>						
					</span>
					<span>
						<g:if test="${isNotAUserRecipe}">
							<g:if test="${isLikedByCurrentUser}">
		  						<span>Usted ya ha votado esta receta</span>
							</g:if>
							<g:else>
					     		<a href="/recipe/like/${recipe.id}" class="btn">Votar receta</a>
							</g:else>
						</g:if>
					</span>
				</div>
            </div>
        </form>
    </div>
    <a href="/"><h2>Volver a buscar recetas!</h2></a>

	<div id="likeUsersModal" class="modal hide fade">
	  <div class="modal-header">
	    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
	    <h3>Usuarios que les gusto la receta</h3>
	  </div>
	  <div class="modal-body">
	    	<g:each in="${recipe.likes}" var="userLike">
                 <div class="row-fluid">
					<div class="span1"><img id="imgSelectedAavatar" src="/img/avatars/avatar${userLike.user.avatar}.png" /></div>
					<div class="span4"><a href="/userInfo/show/${userLike.user.id}">${userLike.user.username}</a></div>
	     		</div>
              </g:each>
	  </div>
	  <div class="modal-footer">
	    <a href="#" data-dismiss="modal" class="btn btn-primary">Cerrar</a>
	  </div>
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