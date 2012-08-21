<html>
<head>
    <meta name="layout" content="main">
    <title>HoyQueComemos</title>
</head>
<body>
<div class="well">
    <div class="row-fluid">
        <form class="form-horizontal wte-form">
            <div class="hero-unit-forms">
                <h2>${recipe.name}</h2>
				<g:if test="${flash.message!=null}">
					<div id="flashAlert" class="alert alert-success">${flash.message}</div>
				</g:if>
                <h3>${recipe.summary}</h3>
                <br/>
                <label><h2>Acá va la foto</h2></label>
				<br/>
				 <div id="recipe-description">
		        	<label><strong>Autor</strong></label>
					<span>${recipe.user.username}</span>
				</div>
                <br/>
                <label><strong>Ingredientes</strong></label>
                <div id="ingredients-list">
                <ul>
                    <g:each in="${recipeComponents}" var="comp">
                        <div class="ingredient-row">
                            <div class="alert token-ingredient">${comp.qty} ${comp.unit.name}  ${comp.ingredient.name}</div>
                        </div>
                    </g:each>
                </ul>
                </div>
                <div id="recipe-description">
                    <label><strong>Pasos a seguir</strong></label>
                    <span>${recipe.description}</span>
                </div>
				 <br/>
				<div>
					<span>
						Cantidad de votos: ${recipe.points}
					</span>
					<span>
						<g:if test="${isNotAUserRecipe}">
							<g:if test="${isLikedByCurrentUser}">
		  						<span>Usted ya ha votado esta receta</span>
							</g:if>
							<g:else>
					     		<a href="/recipe/like/${recipe.id}" class="btn">Votar receta</a>
							</g:else>
						</g:if>
					</span>
				</div>
            </div>
        </form>
    </div>
    <a href="/"><h2>Volver a buscar recetas!</h2></a>
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