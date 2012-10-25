<html>
<head>
    <meta name="layout" content="main">
    <title>HoyQueComemos</title>
</head>
<body>
<div class="well">
       <h1 class="no-recipe-title">
		<sec:ifLoggedIn>
		No encontramos la receta que solicitaste. <a  href="/recipe/create">Si la conoces, la podés agregar vos!</a>
  		</sec:ifLoggedIn>
		 <sec:ifNotLoggedIn>
		No encontramos la receta que solicitaste. <a  href="/login">Si la conoces, la podés agregar vos!</a>
	     </sec:ifNotLoggedIn>
</h1>
</div>
<content tag="js">
	<script type="text/javascript">
		<g:if test="${flash.message!=null}">
			$(document).ready(function() {
				$("#flashAlert").alert();
				});
	    </g:if>

    </script>
</content>
</body>
</html>