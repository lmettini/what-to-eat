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
                  <input type="text" id="input-recp" size="40" maxlength="150" name="search_text" placeholder="search for treats..." />
              </div>
              <input type="submit" name="search" value="Buscar" class="button-form" id="search_button">
          </form>
          <br>
<g:if test="${total == 0}">
<h1 class="no-recipe-title">
		<sec:ifLoggedIn>
		No hay ninguna receta para ofrecerte. <a  href="/recipe/create">Si tenés una, la podés agregar vos!</a>
  		</sec:ifLoggedIn>
		 <sec:ifNotLoggedIn>
		No hay ninguna receta para ofrecerte. <a  href="/login">Si tenés una, la podés agregar vos!</a>
	     </sec:ifNotLoggedIn>
</h1>
</g:if>
<g:else>
            <h2 class="list-title-first">
			Recetas que encontramos para la frase: ${params.query}
			</h2>
			<br>
			<g:each in="${recipes}" var="recipe"  status="j">
                <div class="row-fluid lert alert-info">
					<div class="span2 ">
                        <g:if test="${recipe.firstImage() != null}">
                            <a href="/recipe/show/${recipe.id}"><img width="120" height="120" class="bs-icon img-rec" src="${recipe.firstImage().thumbnail}"></a>
                        </g:if><g:else>
                        <a href="/recipe/show/${recipe.id}"><img width="120" height="120" class="bs-icon img-rec dflt-img" src="/img/dflt.png"></a>
                        </g:else>
                    </div><!--/span-->
                    <div class="span10">
                        <h2 class="rec-title">
                           <a href="/recipe/show/${recipe.id}">${recipe.name}</a>
                        </h2>
								<div class="alert alert-info row-desc">
									<p> <strong>Ingredientes:</strong>
										<g:each in="${recipe.components}" var="cp" status="i">
											<g:if test="${i!=0}">, </g:if>${cp.ingredient.name}
										</g:each>
									</p>
                					<p>${recipe.description}</p>
                                    <p style="float: left;">Autor:</p>
                                    <p>
                                    <tr>
                                        <td><img src="/img/avatars/avatar${recipe.user.avatar}.png" width="60" height="70"  /></td>
                                    </tr>
                                    <strong><a href="/userInfo/show/${recipe.user.id}">${recipe.user.username}</a></strong></p>
                                    <a <g:if test="${res?.recipe?.likes?.size()>0}">href="#likeUsersModal${j}" role="button" data-toggle="modal"</g:if> class="btn btn-primary likes-recipe"><i class="icon-thumbs-up icon-white"></i>  ${recipe.points} personas</a>
           							<p style="text-align:right"><a class="btn btn-primary" href="/recipe/show/${recipe.id}">Ver detalle »</a></p>
								</div>

					</div><!--/span-->
				</div><!--/row-->
                <g:if test="${recipe?.likes?.size()>0}">
                	<div id="likeUsersModal${j}" class="modal hide fade">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
                            <h3>Usuarios que les gusto la receta</h3>
                          </div>
                          <div class="modal-body">
                                <table class="table table-hover">
                                    <tbody>
                                <g:each in="${recipe?.likes}" var="userLike">
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
            <g:if test="${total>max}">
				<div class="pagination-container pagination-centered container-row">
						<g:paginate next="Siguiente" prev="Anterior"
				            controller="listRecipes" action="simpleSearch"    
				        max="${max}" maxsteps="10" total="${total}" params="[query: params.query]" />
				</div>
            </g:if>
		</div>
</g:else>

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