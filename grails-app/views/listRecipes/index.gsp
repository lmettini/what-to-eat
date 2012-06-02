<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
      <title>Simple GSP page</title>
  </head>
  <body>
  <g:render template="/commons/header" />

  <h2>Recetas que encontramos</h2>
  <ul>
  <g:each in="${resultList}" var="res">
    <li>Encontramos la receta "${res.recipe.name}" para los ingredientes [<g:each in="${res.ingredients}" var="ing" status="i"><g:if test="${i!=0}">,</g:if>${ing.name}</g:each>]</li>
  </g:each>
  </ul>



  <g:render template="/commons/footer" />
  </body>
</html>