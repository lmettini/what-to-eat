<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
      <title>Simple GSP page</title>
  </head>
  <body>
  <g:render template="/commons/header" />

  <form action="#">
      <input type="text" id="word">
      </input>
  </form>
  <ul id="ingredientList"></ul>



  <g:render template="/commons/footer" />

  <!--script type="text/javascript" src="http://code.jquery.com/jquery-1.7.2.min.js"></script-->
  <script type="text/javascript" src="/js/jquery-1.7.2.min.js"></script>
  <script type="text/javascript">
    $("#word").keyup(function(){
        $.getJSON("/ingredient/getRelated/"+$("#word").val()+"?callback=?",
              function(data) {
                $("#ingredientList").attr("display","none");
                $("#ingredientList").html("");
                $.each(data, function(i,ingredient){
                  $("#ingredientList").append("<li>"+ingredient.name+"</li>");
                });
                $("#ingredientList").removeAttr("display");
              });
    });
  </script>
  </body>
</html>