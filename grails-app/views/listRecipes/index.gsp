<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
 <meta name="layout" content="main">
    <title>HoyQueComemos</title>
  </head>
  <body>
      <div class="well">

      <h2>Recetas que encontramos para los ingredientes: <g:each in="${ingredients}" var="ing" status="i"><g:if test="${i!=0}">, </g:if>${ing.name}</g:each></h2>

  <ul>
  <g:each in="${resultList}" var="res">
      <div class="row-fluid">
    <li><a href="/recipe/show?r=${res.recipe.id}">"${res.recipe.name}"</a> para los ingredientes [<g:each in="${res.ingredients}" var="ing" status="i"><g:if test="${i!=0}">,</g:if>${ing.name}</g:each>]</li>
          <span>"${res.recipe.summary}"</span>
     </div>
  </g:each>
  </ul>


  </body>
</html>