<html>
  <head>
 <meta name="layout" content="main">
    <title>HoyQueComemos</title>
  </head>
  <body>
      <div class="hero-unit-home">
          <h1>HoyQueComemos</h1>
          <h3>ingresá los ingredientes que tengas y encontrá las mejores recetas en solo unos segundos!</h3>
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
<h1>
		<sec:ifLoggedIn>
		<a  href="/recipe/create">No hay ninguna receta para ofrecerte. Si tenés una, la podés agregar vos!</a>
  		</sec:ifLoggedIn>
		 <sec:ifNotLoggedIn>
		<a  href="/userInfo/create">No hay ninguna receta para ofrecerte. Si tenés una, la podés agregar vos!</a>
	     </sec:ifNotLoggedIn>
</h1>
</g:if>
<g:else>
          <h1>
			Recetas que encontramos para la frase: ${params.query}
			</h1>
			<br>
			<g:each in="${recipes}" var="recipe">
				<div class="row-fluid">
					<div class="span12 alert alert-info">
   						<h2>
							<g:if test="${recipe.firstImage() != null}">
								<img style="padding-right:10px" class="bs-icon" src="${recipe.firstImage().thumbnail}">
			  				</g:if>
                           <a href="/recipe/show/${recipe.id}">${recipe.name}</a>
						</h2>
						<br>
						<p> Ingredientes: 
							<g:each in="${recipe.components}" var="cp" status="i">
								<g:if test="${i!=0}">, </g:if>${cp.ingredient.name}
							</g:each>
						</p>
        				<p>${recipe.description}</p>
        				<p>Autor:</p>
                        <tr>
                            <td><img src="/img/avatars/avatar${recipe.user.avatar}.png" width="60" height="70"  /></td>
                        </tr>
                        <span><a href="/userInfo/show/"${recipe.user.id}>${recipe.user.username}</a></span>
                        <br><br>
                        <a class="btn btn-primary likes-recipe"><i class="icon-thumbs-up icon-white"></i>  ${recipe.points} personas</a>
   						<p class="pull-right"><a class="btn btn-primary" href="/recipe/show/${recipe.id}">Ver detalle »</a></p>
					</div><!--/span-->
				</div><!--/row-->
			</g:each>
				<div class="pagination-container pagination-centered container-row">
						<g:paginate next="Siguiente" prev="Anterior"
				            controller="listRecipes" action="simpleSearch"    
				        max="${max}" maxsteps="10" total="${total}" params="[query: params.query]" />
				</div>

		</div>
</g:else>
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
                  theme: "facebook"
              });
          });
      </script>
  </content>
  </body>
</html>