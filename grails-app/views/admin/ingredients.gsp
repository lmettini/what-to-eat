<html>
  <head>
 <meta name="layout" content="mainadmin">
    <title>HoyQueComemos</title>
	<parameter name="ingredients" value="active" />
  </head>
  <body>
      <div class="well">

    <h2>Ingredientes a moderar</h2>
	<g:if test="${flash.message!=null}">
		<div id="flashAlert" class="alert alert-success">${flash.message}</div>
	</g:if>
		<div class="row-fluid">
			<div class="span2">Ingrediente</div>
			<div class="span2">Creador</div>
     	</div>
  <g:each in="${ingredients}" var="ingredient">
      <div class="row-fluid">
          <div class="span2">${ingredient.name}</div>
          <div class="span2">${ingredient.creator.username}</div>
     </div>
  </g:each>
	<div class="pagination-container">
			<g:paginate next="Siguiente" prev="Anterior"
	            controller="admin" action="ingredients"    
	        max="${max}" maxsteps="10" total="${total}" />
	</div>
  </body>
</html>