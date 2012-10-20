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
                No hay ninguna receta para ofrecerte para los ingredientes:
                <g:each in="${ingredients}" var="ing" status="i"><g:if test="${i!=0}">, </g:if>${ing.name}</g:each>
                <br>
                <sec:ifLoggedIn>
                    <a href="/recipe/create">Si tenés una, la podés agregar vos!</a>
                </sec:ifLoggedIn>
                <sec:ifNotLoggedIn>
                    <a data-toggle="dropdown" href="/login">
                        Si tenés una, la podés agregar vos!
                    </a>
                </sec:ifNotLoggedIn>
			    </h1>
            </g:if>
            <g:if test="${fullMatchList.size()>0}">
                <h2 class="list-title-first">
			    Recetas que encontramos para los ingredientes:
                <g:each in="${ingredients}" var="ing" status="i"><g:if test="${i!=0}">, </g:if>${ing.name}</g:each>
			    </h2>
            </g:if>
			<br>

			<g:each in="${fullMatchList}" var="res" status="j">
				<div class="row-fluid lert alert-info">
					<div class="span2 ">
                        <g:if test="${res.recipe.firstImage() != null}">
                            <img width="120" height="120" class="bs-icon img-rec" src="${res.recipe.firstImage().thumbnail}">
                        </g:if><g:else>
                           <img width="120" height="120" class="bs-icon img-rec dflt-img" src="/img/dflt.png">
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
                					<p>${res.recipe.description}</p>
                                    <p>Autor: <strong><a href="/userInfo/show/${res.recipe.user.id}">${res.recipe.user.username}</a></strong></p>
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
                    </g:if>
			</g:each>


            <g:if test="${midMatchList.size()>0}">  <g:if test="${fullMatchList.size()>0}"><hr><h2 class="list-title"></g:if><g:else><h2 class="list-title-first" ></g:else>   Recetas en las que te faltan 2 o menos ingredientes para hacerla</h2> </g:if>
            <g:each in="${midMatchList}" var="res" status="j">
					<div class="row-fluid lert alert-info">
					<div class="span2 ">
                        <g:if test="${res.recipe.firstImage() != null}">
                            <img width="120" height="120" class="bs-icon img-rec" src="${res.recipe.firstImage().thumbnail}">
                        </g:if><g:else>
                           <img width="120" height="120" class="bs-icon img-rec dflt-img" src="/img/dflt.png">
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
                					<p>${res.recipe.description}</p>
                                    <p>Autor: <strong><a href="/userInfo/show/${res.recipe.user.id}">${res.recipe.user.username}</a></strong></p>
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
                    </g:if>
			</g:each>


  <content tag="js">
      <script type="text/javascript">
          $(document).ready(function() {
              $("#search_button").click(function (e) {
                  var tokens = $("#input-recp").tokenInput("get");
                  if (tokens.length==0){
                      alert("Por favor ingresá algún ingrediente que poseas.")
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