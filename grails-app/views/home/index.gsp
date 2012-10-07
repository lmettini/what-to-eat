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
				<div class="container-fluid">
				<div class="row-fluid">
					<div class="span8">
						<h2>Recetas destacadas</h2>
					</div>
					<div class="span4">
						<h2>Usuarios destacados</h2>
					</div>
				</div><!--/row-->
				<div class="row-fluid">
					<div class="span8">
					<g:each in="${recipes}" var="recipe">
						<div class="row-fluid">
							<div class="span12 alert alert-info">
           						<h2>
									<g:if test="${recipe.firstImage() != null}">
										<img style="padding-right:10px" class="bs-icon" src="${recipe.firstImage().thumbnail}">
					  				</g:if>
									${recipe.name}
								</h2>
								<br>
								<p> Ingredientes: 
										<g:each in="${recipe.components}" var="cp" status="i">
											<g:if test="${i!=0}">, </g:if>${cp.ingredient.name}
										</g:each>
								</p>
                				<p>${recipe.description}</p>
								<p class="pull-left">Creador: ${recipe.user.username} - Votos: ${recipe.points}</p>
           						<p class="pull-right"><a class="btn" href="/recipe/show/${recipe.id}">Ver detalle »</a></p>
        					</div><!--/span-->
      					</div><!--/row-->
					</g:each>
					</div><!--/span-->
					<div class="span4 alert alert-info">
					<g:each status="i" in="${users}" var="user">
						<div class="row-fluid">
							<div class="span12">
           						<h3>
									<img id="imgSelectedAavatar" src="/img/avatars/avatar${user.avatar}.png" width="40" height="47"  />
									<a href="/userInfo/show/${user.id}">${user.username} (${user.points} puntos)</a>
           						</h3>
        					</div><!--/span-->
      					</div><!--/row-->
					</g:each>
					</div><!--/span-->
				</div><!--/row-->
				</div><!--/container-->
			</div>
		</div>
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