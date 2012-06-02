<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
      <title>Simple GSP page</title>
  </head>
  <body>
  <g:render template="/commons/header" />
  <h3>Qué ingredientes tenes?</h3>
  <input type="text" id="word"/>
  <h3>Selecciona</h3>
  <ul id="ingredientList"></ul>
  -------------------------------
  <h3>Lista de ingredientes seleccionados</h3>
  <ul id="selectedIngredients"></ul>
  <input id="buscar" type="button" value="Buscar" disabled>

  <br><br><br>
  <g:render template="/commons/footer" />

  <!--script type="text/javascript" src="http://code.jquery.com/jquery-1.7.2.min.js"></script-->
  <script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script>
  <script type="text/javascript">
    var ingIds = []
    function deleteIngredient(id, name){
        $("#li"+id).remove();
        ingIds = jQuery.grep(ingIds, function(value) {
            return value != id;
        });

        if(ingIds.length==0){
            $("#buscar").attr("disabled",true);
        }

    }
    function addIngredient(id, name){
        if($.inArray(id,ingIds)==-1){
            ingIds[ingIds.length]=id;
            var html = "<li id='li"+id+"'>"+name+" <a href='javascript:deleteIngredient(\""+id+"\")'>Eliminar</a></li>";
            $("#selectedIngredients").append(html);
            $("#buscar").attr("disabled",false);
            $("#word").val("");
            $("#ingredientList").html("");

        }
    }

    $("#word").keyup(function(){
        $.getJSON("/ingredient/getRelated/"+this.value+"?callback=?",
              function(data) {
                $("#ingredientList").attr("display","none");
                $("#ingredientList").html("");
                $.each(data, function(i,ingredient){
                  var html = "<li>"+ingredient.name
                   // console.log(ingredient.id)
                    console.log(ingIds)
                  if($.inArray(ingredient.id+"",ingIds)>-1){
                    html +=" (Ya esta agregado)"
                  } else {
                    html +=" <a href='javascript:addIngredient(\""+ingredient.id+"\",\""+ingredient.name+"\")'>Agregar</a>"
                  }
                  html +="</li>"
                  $("#ingredientList").append(html);
                });
                $("#ingredientList").removeAttr("display");
              });
    });
    $("#buscar").click(function(){
        var idsToSearch= "";
        $.each(ingIds, function(i,ingredient){
            idsToSearch += ingredient+",";
        });
        document.location = "/listRecipes/index/"+idsToSearch
    });
      $("#word").val("");
  </script>
  </body>
</html>