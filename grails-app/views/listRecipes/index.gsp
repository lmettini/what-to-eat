<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
      <title>Simple GSP page</title>
  </head>
  <body>
  <g:render template="/commons/header" />

  <h2>Recetas que encontramos</h2>
  <ul>
  <g:each in="${components}" var="cp">
    <li>Para el ingrediente "${cp.ingredient.name}" de id "${cp.id}" encontre la receta de ${cp.recipe.name}</li>
  </g:each>
  </ul>

  <g:render template="/commons/footer" />
  </body>
</html>