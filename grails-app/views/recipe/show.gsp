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
                <h3>${recipe.summary}</h3>
                <br/>

                <label><h2>Acá va la foto</h2></label>
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
            </div>
        </form>
    </div>
    <a href="/"><h2>Volver a buscar recetas!</h2></a>
</div>
</body>
</html>