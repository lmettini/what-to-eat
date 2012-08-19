<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
 <meta name="layout" content="main">
    <title>HoyQueComemos</title>
	<parameter name="myRecipes" value="active" />
  </head>
  <body>
      <div class="well">

  <h2>Mis Recetas</h2>
  <g:message />
  <ul>
  <g:each in="${recipes}" var="recipe">
      <div class="row-fluid">
    	 <li><a href="/recipe/show?r=${recipe.id}">"${recipe.name}"</a> - <a href="/recipe/delete/${recipe.id}">Eliminar</a></li>
         <span>"${recipe.summary}"</span>
     </div>
  </g:each>
  </ul>


  </body>
</html>