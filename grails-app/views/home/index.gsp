<html>
  <head>
 <meta name="layout" content="main">
    <title>HoyQueComemos</title>
    <parameter name="home" value="active" />
  </head>
  <body>
    <div class="row-fluid">
        <div class="span12">
			<g:if test="${flash.message!=null}">
				<div id="flashAlert" class="alert alert-error">${flash.message}</div>
			</g:if>
          	<div class="hero-unit-home">
            	<h1>HoyQueComemos</h1>
                <h3>ingresá los ingredientes que tengas y encontrá las mejores recetas en sólo unos segundos!</h3>
                  <div id="fb-like-button" class="fb-like" data-href="http://www.facebook.com/platform" data-send="false" data-layout="button_count" data-width="450" data-show-faces="true"></div>
                  <!--<div id="fb-like-button" class="fb-like" data-href="http://www.facebook.com/hoyquecomemos.zumos" data-send="false" data-layout="button_count" data-width="450" data-show-faces="true"></div>-->
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
				<div class="container-fluid">
				<div class="row-fluid">
					<div class="span8 container container-header">
						<h2>Recetas destacadas</h2>
					</div>
					<div class="span4 container container-header">
						<h2>Usuarios destacados</h2>
					</div>
				</div><!--/row-->
				<div class="row-fluid">
					<div class="span8">
					<g:each in="${recipes}" var="recipe" status="j">
						<div class="row-fluid">
							<div class="span12 container container-row">
           						<h2>
									<g:if test="${recipe.firstImage() != null}">
                                        <a href="/recipe/show/${recipe.id}"><img style="padding-right:10px" class="bs-icon" src="${recipe.firstImage().thumbnail}"></a>
					  				</g:if>
                                       <a href="/recipe/show/${recipe.id}">${recipe.name}</a>
								</h2>
								<br>
								<div class="alert alert-info">
									<p> <strong>Ingredientes:</strong>
										<g:each in="${recipe.components}" var="cp" status="i">
											<g:if test="${i!=0}">, </g:if>${cp.ingredient.name}
										</g:each>
									</p>
                					<p>${recipe.summary}</p>
                                    <p style="float: left;">Autor:</p>
                                    <p>
                                        <tr>
                                            <td><img src="/img/avatars/avatar${recipe.user.avatar}.png" width="60" height="70"  /></td>
                                        </tr>
                                        <strong><a href="/userInfo/show/${recipe.user.id}">${recipe.user.username}</a></strong></p>
                                    <a href="#likeUsersModal${j}" role="button" data-toggle="modal" class="btn btn-primary likes-recipe"><i class="icon-thumbs-up icon-white"></i> ${recipe.points} personas</a>
           							<p style="text-align:right"><a class="btn btn-primary" href="/recipe/show/${recipe.id}">Ver detalle »</a></p>
								</div>
        					</div><!--/span-->
      					</div><!--/row-->
							<div id="likeUsersModal${j}" class="modal hide fade" style="z-index: 2061">
							  <div class="modal-header">
							    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
							    <h3>Usuarios que les gusto la receta ${recipe.name}</h3>
							  </div>
							  <div class="modal-body">
									<table class="table table-hover">
										<tbody>
							    	<g:each in="${recipe.likes}" var="userLike">
							      				<tr>
													<td><img id="imgSelectedAvatar" src="/img/avatars/avatar${userLike.user.avatar}.png" width="60" height="70"  /></td>
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
					</div><!--/span-->
					<div class="span4 container container-row">
						<table>
					<g:each status="i" in="${users}" var="user">
						<div class="row-fluid">
							<div class="span12">
           						<h3 class="user-detacado">
									<img id="imgSelectedAavatar" class="img-polaroid" src="/img/avatars/avatar${user.avatar}.png" width="40" height="47"  />
									<a href="/userInfo/show/${user.id}">${user.username} (${user.points} puntos)</a>
           						</h3>
        					</div><!--/span-->
      					</div><!--/row-->
					</g:each>
                        </table>
					</div><!--/span-->
                    <div class="span4 container container-row">
                        <table>
                            <div class="row-fluid">
                                <div class="span12 height430">
                                    <div class="fb-like-box" data-href="http://www.facebook.com/platform" data-width="340" data-height="430" data-show-faces="true" data-stream="true" data-header="true"></div>
                                <!--<div class="fb-like-box" data-href="http://www.facebook.com/hoyquecomemos.zumos" data-width="340" data-height="300" data-show-faces="true" data-stream="true" data-header="true"></div>-->
                                </div><!--/span-->
                            </div><!--/row-->
                        </table>
                    </div><!--/span-->
                </div><!--/row-->
				</div><!--/container-->
			</div>
		</div>
	</div>
    <div id="noIngs" class="modal hide fade">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
        <h3>Debes ingresar al menos un ingrediente para comenzar la búsqueda</h3>
        <br>
      </div>
      <div class="modal-footer">
        <a href="#" data-dismiss="modal" class="btn">Aceptar</a>
      </div>
    </div>
  <div id="moreThan300Char" class="modal hide fade">
      <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
          <h3>Debes ingresar menos de 300 caracteres para realizar la búsqueda</h3>
          <br>
      </div>
      <div class="modal-footer">
          <a href="#" data-dismiss="modal" class="btn">Aceptar</a>
      </div>
  </div>
	<content tag="js">
    <div id="fb-root"></div>
    <script>(function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = "//connect.facebook.net/en_GB/all.js#xfbml=1";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));
    </script>
     <script type="text/javascript">
    $(document).ready(function() {
        $("#search_button").click(function (e) {
            var tokens = $("#input-recp").tokenInput("get");
            if (tokens.length==0){
                $("#noIngs").modal("show");
            } else {
                if ($('#search_text li p').text().length > 300){
                    $('#moreThan300Char').modal('show');
                } else {
                var i,query="";

                for(i=0;i<tokens.length;i++){
                    if(i>0){
                        query+=","
                    }
                    query+=tokens[i].id
                }
                $.cookie('newbieMsgShowed','true',{ expires: 1000, path: '/' })
                document.location="/listRecipes?q="+query
            }}
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

            var msg = $.cookie('newbieMsgShowed');
            if(msg == null || msg != "true"){
                $(".token-input-input-token-facebook").popover({
                    animation: true,
                    delay: { show: 1000, hide: 100 },
                    title: "Comenzá tu busqueda",
                    content: "Ingresá los ingredientes que tengas y descubrí que podes cocinar",
                    placement: "right",
                    trigger: "manual"
                });
                $(".token-input-input-token-facebook").popover("show");
                $("#token-input-input-recp").bind("focus",function(){
                    $(".token-input-input-token-facebook").popover("hide");
                });
            }
        });
        </script>
	</content>
  </body>
</html>