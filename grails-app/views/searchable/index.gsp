<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
  </head>
  <body>
 	<g:each var="recipe" in="${searchResult?.results}">
		<div class="recipe">
			${recipe.id} - ${recipe.name}
		</div>
	</g:each>	
 </body>
</html>