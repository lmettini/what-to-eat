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

          <h1>
			Recetas que encontramos para los ingredientes: 
			<g:each in="${ingredients}" var="ing" status="i"><g:if test="${i!=0}">, </g:if>${ing.name}</g:each>
			</h1>
			<br>
			<g:each in="${resultList}" var="res">
				<div class="row-fluid">
					<div class="span12 alert alert-info">
   						<h2>
							<g:if test="${res.recipe.firstImage() != null}">
								<img style="padding-right:10px" class="bs-icon" src="${res.recipe.firstImage().thumbnail}">
			  				</g:if>
                           <a href="/recipe/show/${res.recipe.id}">${res.recipe.name}</a>
						</h2>
						<br>
						<p> Ingredientes: 
							<g:each in="${res.recipe.components}" var="cp" status="i">
								<g:if test="${i!=0}">, </g:if>${cp.ingredient.name}
							</g:each>
						</p>
        				<p>${res.recipe.description}</p>
						<p class="pull-left">Autor: ${res.recipe.user.username}</p><br><br>
                        <a class="btn btn-primary likes-recipe"><i class="icon-thumbs-up icon-white"></i>  ${res.recipe.points} personas</a>
   						<p class="pull-right"><a class="btn btn-primary" href="/recipe/show/${res.recipe.id}">Ver detalle »</a></p>
					</div><!--/span-->
				</div><!--/row-->
			</g:each>


		</div>
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