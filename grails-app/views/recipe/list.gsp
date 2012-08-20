<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
 <meta name="layout" content="main">
    <title>HoyQueComemos</title>
	<parameter name="myRecipes" value="active" />
  </head>
  <body>
      <div class="well">

  <h2>Mis Recetas - <a href="/recipe/create">Crear una nueva receta!</a></h2>
  <g:message />
  <ul>
  <g:each in="${recipes}" var="recipe">
      <div class="row-fluid">
    	 <li><a href="/recipe/show?r=${recipe.id}">"${recipe.name}"</a> - <a href="/recipe/edit/${recipe.id}"><img src="\img\edit.png" title="Editar la receta"/></a><img src="\img\delete.png" title="Eliminar la receta"/></a></li>
         <span>"${recipe.summary}"</span>
     </div>
  </g:each>
  </ul>


  </body>
</html>