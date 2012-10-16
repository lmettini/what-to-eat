<html>
<head>
    <meta name="layout" content="main">
    <title>HoyQueComemos</title>
</head>
<body>
<div class="well">
        <!--form class="form-horizontal wte-form"-->
            <div id="show-recipe" class="hero-unit-forms">

                <div class="row-fluid">
                <h1 style="float: left; margin-right: 10px;">${recipe.name}</h1> <label style="margin-top: 10px">(${recipe.category.description})</label>
				<g:if test="${flash.message!=null}">
					<div id="flashAlert" class="alert alert-success">${flash.message}</div>
				</g:if>
                </div>


                <div class="row-fluid top8">
                    <div class="span6">

                        <div class="row-fluid top8">
                            <div class="span10 container container-header">
                                Resúmen
                            </div>
                        </div>
                        <div class="row-fluid">
                            <h3><pre class="span11 recipePre">${recipe.summary}</pre></h3>
                        </div>

                        <div class="row-fluid top8">
                            <div class="span10 container container-header">
                                Ingredientes
                            </div>
                        </div>

                        <div class="row-fluid">
                            <div class="span11" id="ingredients-list">
                            <ul>
                                <g:each in="${recipeComponents}" var="comp">
                                    <div class="ingredient-row">
                                        <div class="alert token-ingredient">${comp.qty} ${comp.unit.name}  ${comp.ingredient.name}</div>
                                    </div>
                                </g:each>
                            </ul>
                            </div>
                        </div>

                        <div class="row-fluid top8">
                            <div class="span10 container container-header">
                                Pasos a seguir
                            </div>
                        </div>
                        <div class="row-fluid">
                            <div class="span0"></div>
                            <div class="span11 offset1">
                                <span><pre class="recipePre">${recipe.description}</pre></span>
                            </div>
                        </div>

                        <div class="row-fluid top8">
                            <div class="span10 container container-header">
                                Autor
                            </div>
                        </div>

                        <div class="row-fluid">
                            <div class="span0"></div>
                            <div class="span11 offset1">
                                <tr>
                                    <td><img src="/img/avatars/avatar${recipe.user.avatar}.png" width="60" height="70"  /></td>
                                </tr>
                                <span><a href="/userInfo/show/${recipe.user.id}">${recipe.user.username}</a></span>
                            </div>
                        </div>

                        <div class="row-fluid top8 botton8">
                            <div class="span0"></div>
                            <div class="span11 offset1">
                                <span>
                                    <g:if test="${recipe.points == 0}">
                                        <a class="btn btn-primary likes-recipe"><i class="icon-thumbs-up icon-white"></i> ${recipe.points} personas</a>
                                    </g:if>
                                    <g:else>
                                        <a href="#likeUsersModal" role="button" data-toggle="modal" class="btn btn-primary likes-recipe"><i class="icon-thumbs-up icon-white"></i>  ${recipe.points} personas</a>
                                    </g:else>
                                </span>

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
                        </div>
                    </div>

                    <div class="span6">




                        <g:if test="${recipe.images}">
                            <div class="row-fluid top8">
                                <div class="span10 container container-header">
                                    Fotos
                                </div>
                            </div>

                            <div class="row-fluid">
                                <div class="spanasdad"></div>
                                <div class="span10 offset2">
                                    <div   id="itemsCarr" class="carousel slide">

                                        <div  class="carousel-inner">
                                        <g:each status="i" in="${recipe.images}" var="image">
                                            <div class="item <g:if test="${i==0}">active</g:if>"><img src="${image.medium}"></div>
                                        </g:each>
                                        </div>
                                        <!-- Carousel nav -->
                                        <g:if test="${recipe.images.size()>1}">
                                        <a class="carousel-control left" href="#itemsCarr" data-slide="prev">&lsaquo;</a>
                                        <a class="carousel-control right" href="#itemsCarr" data-slide="next">&rsaquo;</a>
                                        </g:if>
                                    </div>
                                </div>
                            </div>
                        </g:if>
                        <g:if test="${recipe.video}">

                            <div class="row-fluid top8">
                                <div class="span10 container container-header">
                                    Video
                                </div>
                            </div>

                            <div class="row-fluid">
                                <div class="span0"></div>
                                <div class="span10 offset2">
                                    <object width="425" height="350"><param name="movie" value="${recipe.video}"><embed src="${recipe.video}" type="application/x-shockwave-flash" width="425" height="350"></object>
                                </div>
                            </div>
                        </g:if>

                    </div>
                </div>

                            <div class="form-horizontal wte-form form-actions">
                                <a class="btn btn-danger back-to-recipes" href="/">Volver a buscar recetas</a>
                            </div>
            </div>
        <!--/form-->
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