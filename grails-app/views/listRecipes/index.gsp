<html>
  <head>
 <meta name="layout" content="main">
    <title>HoyQueComemos</title>
  </head>
  <body>
      <div class="hero-unit-home">
          <h1>HoyQueComemos</h1>
          <h3>ingresá los ingredientes que tengas y encontrá las mejores recetas en sólo unos segundos!</h3>
      </div>
      <div class="well">
          <br>
          <form action="#" method="post" id="search_form" class="clearfix">
              <div>
                  <input type="text" id="input-recp" size="40" maxlength="150" name="search_text" />
              </div>
              <input type="submit" name="search" value="Buscar" class="button-form" id="search_button">
          </form>
          <br>

            <g:if test="${fullMatchList.size()==0 && midMatchList.size()==0}">
                <h1 class="no-recipe-title">
                No hay ninguna receta para ofrecerte con los ingredientes:
                <g:each in="${ingredients}" var="ing" status="i"><g:if test="${i!=0}">, </g:if>${ing.name}</g:each>
                    <sec:ifLoggedIn>
                        <a  href="/recipe/create">.<br>Si tenés una, la podés agregar vos!</a>
                    </sec:ifLoggedIn>
                    <sec:ifNotLoggedIn>
                        <a  href="/login">.<br>Si tenés una, la podés agregar vos!</a>
                    </sec:ifNotLoggedIn>
                </h1>
            </g:if>
            <g:if test="${fullMatchList.size()>0}">
                <h2 class="list-title-first">
			    Recetas que encontramos con los ingredientes:
                <g:each in="${ingredients}" var="ing" status="i"><g:if test="${i!=0}">, </g:if>${ing.name}</g:each>
			    </h2>
            </g:if>
			<br>

			<g:each in="${fullMatchList}" var="res" status="j">
				<div class="row-fluid lert alert-info list-margin">
					<div class="span2 ">
                        <g:if test="${res.recipe.firstImage() != null}">
                            <a href="/recipe/show/${res.recipe.id}"><img class="bs-icon img-rec img-list" src="${res.recipe.firstImage().medium}"></a>
                        </g:if><g:else>
                           <a href="/recipe/show/${res.recipe.id}"><img width="150" height="150" class="bs-icon img-rec dflt-img" src="/img/dflt.png"></a>
                        </g:else>
                    </div><!--/span-->
                    <div class="span10">
                        <h2 class="rec-title">
                           <a href="/recipe/show/${res.recipe.id}">${res.recipe.name}</a>
                        </h2>
								<div class="alert alert-info row-desc">
									<p> <strong>Ingredientes:</strong>
										<g:each in="${res.recipe.components}" var="cp" status="i">
											<g:if test="${i!=0}">, </g:if>${cp.ingredient.name}
										</g:each>
									</p>
                					<p>${res.recipe.summary}</p>
                                    <div style="margin-top: 17px;">
                                    <p style="float: left;margin-right: 10px;">Autor:</p>
                                    <p>
                                        <tr>
                                            <td><img src="/img/avatars/avatar${res.recipe.user.avatar}-tiny.jpg" width="30" height="35"  /></td>
                                        </tr>
                                        <strong><a href="/userInfo/show/${res.recipe.user.id}">${res.recipe.user.username}</a></strong></p></div>
                                    <a <g:if test="${res?.recipe?.likes?.size()>0}">href="#likeUsersModal${j}" role="button" data-toggle="modal"</g:if> class="btn btn-primary likes-recipe"><i class="icon-thumbs-up icon-white"></i>  ${res.recipe.points} personas</a>
           							<p style="text-align:right"><a class="btn btn-primary" href="/recipe/show/${res.recipe.id}">Ver detalle »</a></p>
								</div>

					</div><!--/span-->
				</div><!--/row-->
                   <g:if test="${res?.recipe?.likes?.size()>0}">
                	<div id="likeUsersModal${j}" class="modal hide fade">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
                            <h3>Usuarios que les gusto la receta</h3>
                          </div>
                          <div class="modal-body">
                                <table class="table table-hover">
                                    <tbody>
                                <g:each in="${res?.recipe?.likes}" var="userLike">
                                            <tr>
                                                <td><img id="imgSelectedAvatar" src="/img/avatars/avatar${userLike.user.avatar}-tiny.jpg" width="60" height="70"  /></td>
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
                    </g:if>
			</g:each>


            <g:if test="${midMatchList.size()>0}">
                <g:if test="${fullMatchList.size()>0}">
                    <hr><h2 class="list-title">
                </g:if>
                <g:else>
                    <h2 class="list-title-first" >
                </g:else>
                Recetas en las que te faltan 1 o 2 ingredientes para hacerla</h2>
                <h3 style="margin-left: 16px;">Ingredientes buscados: <g:each in="${ingredients}" var="ing" status="i"><g:if test="${i!=0}">, </g:if>${ing.name}</g:each></h3>
            </g:if>
            <g:each in="${midMatchList}" var="res" status="j">
					<div class="row-fluid lert alert-info list-margin">
					<div class="span2 ">
                        <g:if test="${res.recipe.firstImage() != null}">
                            <a href="/recipe/show/${res.recipe.id}"><img class="bs-icon img-rec img-list" src="${res.recipe.firstImage().medium}"></a>
                        </g:if><g:else>
                            <a href="/recipe/show/${res.recipe.id}"><img width="150" height="150" class="bs-icon img-rec dflt-img" src="/img/dflt.png"></a>
                        </g:else>
                    </div><!--/span-->
                    <div class="span10">
                        <h2 class="rec-title">
                           <a href="/recipe/show/${res.recipe.id}">${res.recipe.name}</a>
                        </h2>
								<div class="alert alert-info row-desc">
									<p> <strong>Ingredientes:</strong>
										<g:each in="${res.recipe.components}" var="cp" status="i">
											<g:if test="${i!=0}">, </g:if>${cp.ingredient.name}
										</g:each>
									</p>
                					<p>${res.recipe.summary}</p>
                                    <div style="margin-top: 17px;">
                                    <p style="float: left;margin-right: 10px;">Autor:</p>
                                    <p>
                                        <tr>
                                            <td><img src="/img/avatars/avatar${res.recipe.user.avatar}-tiny.jpg" width="30" height="35"  /></td>
                                        </tr>
                                        <strong><a href="/userInfo/show/${res.recipe.user.id}">${res.recipe.user.username}</a></strong></p>
                                       </div>
                                    <a <g:if test="${res?.recipe?.likes?.size()>0}">href="#likeUsersModal${j}" role="button" data-toggle="modal"</g:if> class="btn btn-primary likes-recipe"><i class="icon-thumbs-up icon-white"></i>  ${res.recipe.points} personas</a>
           							<p style="text-align:right"><a class="btn btn-primary" href="/recipe/show/${res.recipe.id}">Ver detalle »</a></p>
								</div>

					</div><!--/span-->
				</div><!--/row-->
                   <g:if test="${res?.recipe?.likes?.size()>0}">
                	<div id="likeUsersModal${j}" class="modal hide fade">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
                            <h3>Usuarios que les gusto la receta</h3>
                          </div>
                          <div class="modal-body">
                                <table class="table table-hover">
                                    <tbody>
                                <g:each in="${res?.recipe?.likes}" var="userLike">
                                            <tr>
                                                <td><img id="imgSelectedAavatar" src="/img/avatars/avatar${userLike.user.avatar}-tiny.jpg" width="60" height="70"  /></td>
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
                    </g:if>
			</g:each>

       <g:if test="${total>maxrows}">
				<div class="pagination-container pagination-centered container-row">
						<g:paginate next="Siguiente" prev="Anterior"
				            controller="listRecipes" action="index"
				        max="${maxrows}" maxsteps="10" total="${total}" params="[q: params.q]" />
				</div>
            </g:if>


           <div id="noIngs" class="modal hide fade">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
                <h3>Debes ingresar al menos un ingrediente para comenzar la busqueda</h3>
                <br>
              </div>
              <div class="modal-footer">
                <a href="#" data-dismiss="modal" class="btn">Aceptar</a>
              </div>
        </div>
        </div>
  <content tag="js">
      <script type="text/javascript">
          $(document).ready(function() {
              $("#search_button").click(function (e) {
                  var tokens = $("#input-recp").tokenInput("get");
                  if (tokens.length==0){
                        $("#noIngs").modal("show");
                  } else {
                      var i,query="";

                      for(i=0;i<tokens.length;i++){
                          if(i>0){
                              query+=","
                          }
                          query+=tokens[i].id
                      }
                      document.location="/listRecipes?q="+query
                  }
                  e.preventDefault();
                  e.stopPropagation();
              });
          });
          // /ingredient/getRelated/
          // http://shell.loopj.com/tokeninput/tvshows.php
          $(document).ready(function() {
              //$("#input-recp").tokenInput("http://shell.loopj.com/tokeninput/tvshows.php", {
              $("#input-recp").tokenInput("/ingredient/getRelated/", {
                resultsLimit : 20,
                minChars : 2,
                theme: "facebook",
                hintText : "Ingresa tus ingredientes",
                noResultsText : "No encontramos ese ingrediente.",
                searchingText : "Buscando.."
              });
          });
      </script>
  </content>
  </body>
</html>