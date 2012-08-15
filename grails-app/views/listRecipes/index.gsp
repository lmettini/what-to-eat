<%@ page contentType="text/html;charset=UTF-8" %>
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


  </body>
</html>