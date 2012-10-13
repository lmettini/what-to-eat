<html>
<head>
    <meta name="layout" content="main">
    <title>HoyQueComemos</title>
</head>
<body>
<div class="well">
    <div class="row-fluid">
        <form class="form-horizontal wte-form">
            <div id="show-recipe" class="hero-unit-forms">
                <h2 style="float: left; margin-right: 10px;">${recipe.name}</h2> <label style="margin-top: 10px">(${recipe.category.description})</label>
				<g:if test="${flash.message!=null}">
					<div id="flashAlert" class="alert alert-success">${flash.message}</div>
				</g:if>
                <br/>
                <div class="span4 container container-header">
                    Resúmen
                </div>
                <br/><br/><br/>
                <h3><pre class="recipePre">${recipe.summary}</pre></h3>
                <br/>
                <g:if test="${recipe.images}">
                    <div class="span4 container container-header">
                        Fotos
                    </div><br/><br/><br/>
					<div class="controls">
                          <ul id="imgListRec" >
							<g:each status="i" in="${recipe.images}" var="image">
								<div x-data-id="${image.id}"><img src="${image.medium}"></div>
		  					</g:each>
                        </ul>
               		</div>
                </g:if>
                <g:if test="${recipe.video}">
                    <div class="span4 container container-header">
                        Video
                    </div><br/><br/><br/>
                    <div class="video-container">
                        <object width="425" height="350"><param name="movie" value="${recipe.video}"><embed src="${recipe.video}" type="application/x-shockwave-flash" width="425" height="350"></object>
                    </div>
                    <br/>
                </g:if>
                <br/>
                <div class="span4 container container-header">
                    Ingredientes
                </div>
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
                    <div class="span4 container container-header">
                        Pasos a seguir
                    </div><br/><br/><br/>
                    <span><pre class="recipePre">${recipe.description}</pre></span>
                </div>
				 <br/>
                <div id="recipe-autor">
                    <div class="span4 container container-header">
                        Autor
                    </div>
                    <br/><br/><br/><br/>
                    <tr>
                        <td><img src="/img/avatars/avatar${recipe.user.avatar}.png" width="60" height="70"  /></td>
                    </tr>
                    <span><a href="/userInfo/show/"${recipe.user.id}>${recipe.user.username}</a></span>
                </div>
                <br/>
                <div>
                    <div>
                    <span>
						<g:if test="${recipe.points == 0}">
                            <a class="btn btn-primary likes-recipe"><i class="icon-thumbs-up icon-white"></i> ${recipe.points} personas</a>
						</g:if>
						<g:else>
                            <a href="#likeUsersModal" role="button" data-toggle="modal" class="btn btn-primary likes-recipe"><i class="icon-thumbs-up icon-white"></i>  ${recipe.points} personas</a>
						</g:else>						
					</span>
                    </div>
                    <div >
					<span>
						<g:if test="${isNotAUserRecipe}">
							<g:if test="${isLikedByCurrentUser}">
		  						<span>Usted ya ha votado esta receta</span>
							</g:if>
							<g:else>
					            <a class="btn btn-primary likes-recipe" href="/recipe/like/${recipe.id}"><i class="icon-thumbs-up icon-white"></i> Me gusta</a>
							</g:else>
						</g:if>
					</span>
                    </div>
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