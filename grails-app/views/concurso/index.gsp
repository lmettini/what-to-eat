<html>
  <head>
 <meta name="layout" content="main">
    <title>HoyQueComemos</title>
<parameter name="contest" value="active" />
  </head>
  	<body>
	<g:if test="${contest == null}">
		<div class="well container container-row">
			<h1>Todavia no cerro ningun concurso</h1>
		</div>
	</g:if>
	<g:else>
			<div class="well container container-row">
				<h1>Concurso: ${contest.monthDescription()} - ${contest.year}</h1>
				<br>
				<g:if test="${winners.size() == 0}">
					<h2>No hay ganadores en este mes</h2>
				</g:if>
				<g:else>
						<g:each in="${winners}" var="winner" status="i">
							<div class="row-fluid">
								<div class="span12 alert alert-info">
									<h2>
										<g:if test="${winner.recipe.firstImage() != null}">
											<img style="padding-right:10px" class="bs-icon" src="${winner.recipe.firstImage().thumbnail}">
						  				</g:if>
				                       <a href="/recipe/show/${winner.recipe.id}">${winner.recipe.name}</a>
									</h2>
									<br>
                                    <label id="prize-label">Premio</label>
									<p> Ingredientes: 
										<g:each in="${winner.recipe.components}" var="cp" status="j">
											<g:if test="${j!=0}">, </g:if>${cp.ingredient.name}
										</g:each>
									</p>
                                    <tr>
                                        <td><img id="prize-image" style="padding-right:10px" class="bs-icon" src="/img/${i}.jpg" width="180" height="150"></td>
                                    </tr>
                                    <p>${winner.recipe.description}</p>
				    				<p>Autor:</p>
				                    <tr>
				                        <td><img src="/img/avatars/avatar${winner.recipe.user.avatar}.png" width="60" height="70"  /></td>
				                    </tr>
				                    <span><a href="/userInfo/show/${winner.recipe.user.id}">${winner.recipe.user.username}</a></span>
				                    <br><br>
				                    <a href="#likeUsersModal${i}" role="button" data-toggle="modal" class="btn btn-primary likes-recipe"><i class="icon-thumbs-up icon-white"></i>  ${winner.points} personas en el mes</a>
				<a class="btn btn-primary likes-recipe" href="/recipe/like/${winner.recipe.id}"><i class="icon-thumbs-up icon-white"></i> Me gusta</a>
									<p class="pull-right"><a class="btn btn-primary" href="/recipe/show/${winner.recipe.id}">Ver detalle »</a></p>
								</div><!--/span-->
							</div><!--/row-->
							<div id="likeUsersModal${i}" class="modal hide fade">
							  <div class="modal-header">
							    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
							    <h3>Usuarios que les gusto la receta ${winner.recipe.name} en el mes</h3>
							  </div>
							  <div class="modal-body">
									<table class="table table-hover">
										<tbody>
							    	<g:each in="${winner.likes}" var="userLike">
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
						</g:each>
				</g:else>
			</div>
	</g:else>
	
	</body>
</html>