<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
      <meta charset="utf-8">
    <title>HoyQueComemos</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
  <g:render template="/commons/styles" />
  </head>
  <body>
  <g:render template="/commons/header" />
     <div class="container-fluid">
      <div class="well">

  <h2>Recetas que encontramos</h2>

  <ul>
  <g:each in="${resultList}" var="res">
      <div class="row-fluid">
    <li><a href="#">"${res.recipe.name}"</a> para los ingredientes [<g:each in="${res.ingredients}" var="ing" status="i"><g:if test="${i!=0}">,</g:if>${ing.name}</g:each>]</li>
          <span>"${res.recipe.summary}"</span>
     </div>
  </g:each>
  </ul>

     </div>

  <hr>
  <g:render template="/commons/footer" />
  </div>
  <g:render template="/commons/js" />
  </body>
</html>