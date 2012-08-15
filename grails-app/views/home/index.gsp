<html>
  <head>
 <meta name="layout" content="main">
    <title>HoyQueComemos</title>
  </head>
  <body>
  	<content tag="menu">
		 <li class="active"><a href="/">Inicio</a></li>
         <li><a href="/help">Ayuda y preguntas</a></li>
         <li><a href="#contact">Contactanos</a></li>
	</content>
    <div class="row-fluid">

        <div class="span12">
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
          <h3><a href="/help">No entiendo! ¿cómo funciona?</a></h3>
		  <h3><a href="/ingredient/create">Crear Ingrediente</a></h3>
          <h3><a href="/recipe/create">Crear Receta</a></h3>
          %{--<div class="row-fluid">--}%
            %{--<div class="span4">--}%
               %{--<h2><img style="padding-right:10px" class="bs-icon" src="/img/pie.png">Happy Pie</h2>--}%
                    %{--<p>Cupcake ipsum dolor sit. Amet gummies cheesecake chupa chups lollipop tart wypas gingerbread. Tiramisu danish liquorice dessert. Amet gummies cheesecake chupa chups lollipop tart wypas</p>--}%
               %{--<p class="pull-right"><a class="btn" href="#">Yummy Click »</a></p>--}%
            %{--</div><!--/span-->--}%
            %{--<div class="span4">--}%
              %{--<h2><img style="padding-right:10px" class="bs-icon" src="/img/brownie.png">Bouncin Brownies</h2>--}%
              %{--<p>Cupcake ipsum dolor sit. Amet gummies cheesecake chupa chups lollipop tart wypas gingerbread. Tiramisu danish liquorice dessert. Amet gummies cheesecake chupa chups lollipop tart wypas</p>--}%
              %{--<p class="pull-right"><a class="btn" href="#">Yummy Click »</a></p>--}%
            %{--</div><!--/span-->--}%
            %{--<div class="span4">--}%

              %{--<h2><img style="padding-right:10px" class="bs-icon" src="/img/cupcake.png">Sweet Cupcake</h2>--}%
                    %{--<p>Cupcake ipsum dolor sit. Amet gummies cheesecake chupa chups lollipop tart wypas gingerbread. Tiramisu danish liquorice dessert. Amet gummies cheesecake chupa chups lollipop tart wypas</p>--}%
              %{--<p class="pull-right"><a class="btn" href="#">Yummy Click »</a></p>--}%
            %{--</div><!--/span-->--}%
          %{--</div><!--/row-->--}%

        </div><!--/span-->
      </div><!--/row-->
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