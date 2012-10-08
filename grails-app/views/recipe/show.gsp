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
                <h2>${recipe.name}</h2> <label>(${recipe.category.description})</label>
				<g:if test="${flash.message!=null}">
					<div id="flashAlert" class="alert alert-success">${flash.message}</div>
				</g:if>
                <br/>
                <label><strong>Resúmen</strong></label>
                <h3>${recipe.summary}</h3>
                <br/>
                <g:if test="${recipe.images}">
                    <label><h2>Fotos</h2></label>
					<div class="controls">
                          <ul id="imgListRec" >
							<g:each status="i" in="${recipe.images}" var="image">
								<div x-data-id="${image.id}"><img src="${image.medium}"></div>
		  					</g:each>
                        </ul>
               		</div>
                </g:if>
                <g:if test="${recipe.video}">
                    <label><h2>Video</h2></label>
                    <div class="video-container">
                        <object width="425" height="350"><param name="movie" value="${recipe.video}"><embed src="${recipe.video}" type="application/x-shockwave-flash" width="425" height="350"></object>
                    </div>
                    <br/>
                </g:if>
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
						<g:if test="${recipe.points == 0}">
                            <a class="btn btn-primary"><i class="icon-thumbs-up icon-white"></i>  ${recipe.points} personas</a>
						</g:if>
						<g:else>
                            <a class="btn btn-primary"><i class="icon-thumbs-up icon-white"></i>  ${recipe.points} personas</a>
						</g:else>						
					</span>
					<span>
						<g:if test="${isNotAUserRecipe}">
							<g:if test="${isLikedByCurrentUser}">
		  						<span>Usted ya ha votado esta receta</span>
							</g:if>
							<g:else>
					<a class="btn btn-primary" href="/recipe/like/${recipe.id}"><i class="icon-thumbs-up icon-white"></i> Me gusta</a>
							</g:else>
						</g:if>
					</span>
					<div class="form-actions">
						<a class="btn btn-danger back-to-recipes" href="/">Volver a buscar recetas</a>
					</div>
				</div>
            </div>
        </form>
    </div>
  
	<div id="likeUsersModal" class="modal hide fade">
	  <div class="modal-header">
	    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
	    <h3>Usuarios que les gusto la receta</h3>
	  </div>
	  <div class="modal-body">
			<table class="table table-hover">
				<tbody>
	    	<g:each in="${recipe.likes}" var="userLike">
	      				<tr>
							<td><img id="imgSelectedAavatar" src="/img/avatars/avatar${userLike.user.avatar}.png" width="60" height="70"  /></td>
							<td><a href="/userInfo/show/${userLike.user.id}">${userLike.user.username}</a></td>
	     				</tr>
              </g:each>
			</tbody>
		</table>
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