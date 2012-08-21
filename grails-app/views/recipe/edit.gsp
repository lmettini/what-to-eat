<html>
  <head>
 <meta name="layout" content="main">
    <title>HoyQueComemos</title>
  </head>
  <body>
      <div class="well">
        <div class="row-fluid">
            <form id="recipeForm" class="form-horizontal wte-form">
              <div class="hero-unit-forms">

                <h2>Editá la Receta</h2>
                <br/>
                <div class="tabbable"> <!-- Only required for left/right tabs -->
                  <ul class="nav nav-tabs">
                    <li class="active"><a id="t-1" href="#tab1" data-toggle="tab">Paso 1</a></li>
                    <li><a id="t-2" href="#tab2" data-toggle="tab">Paso 2</a></li>
                  </ul>
                  <div class="tab-content">
                    <div class="tab-pane active" id="tab1">
                        <fieldset>
                            <div class="control-group">
                                <label class="control-label" for="title">Titulo de la Receta</label>
                                <div class="controls">
                                    <input type="text" autocomplete="off" class="input-xlarge" id="title" maxlength="100" value="${recipe.title}">
                                    <div class="alert alert-error help-block alert-title">Debes ingresar un titulo</div>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="file">Sube una foto</label>
                                <div class="controls">
                                    <input type="file" autocomplete="off" class="input-file" id="file" >
                                    <p class="help-block">Proximamente podras subir videos de Youtube</p>
                                </div>
                            </div>
                        </fieldset>
                        <div class="form-actions">
                            <input type="button" id="nxtFS" name="create" value="Siguiente" class="button-form">

                        </div>


                    </div>
                    <div class="tab-pane" id="tab2">
						<div id="tab2Alert" class="alert alert-error" style="display:none">
						</div>
                        <fieldset>
                            <div class="control-group">
                                <label class="control-label" for="ingred">Qué ingredientes lleva tu receta?</label>
                                <div class="controls ">
                                    <input type="text" id="ingred">
                                    <input type="number" min="0" max="99999" autocomplete="off" class="span1 inline-input" id="qty" maxlength="5">
                                    <select class="span2 inline-input" id="units">
                                        <option value="0">Medida</option>
                                        <option>cucharadas</option>
                                        <option>gramos</option>
                                        <option>paquetes</option>
                                        <option>litros</option>
                                    </select>
                                    <input type="button" name="create" value="Agregar" class="btn inline add-ing">
									
									<a id="btnIngredientModal" class="btn" data-toggle="modal">Crear ingrediente</a>
									
                                    <div class="alert alert-error help-block alert-ingred" id="ing-alert1">Debes completar todos los campos para ingresar un ingrediente</div>
                                    <div class="alert alert-error help-block alert-ingred" id="ing-alert2">Debes agregar al menos un ingrediente</div>
                                    <div class="alert alert-error help-block alert-ingred" id="ing-alert3">Ya ingresaste ese ingrediente</div>
                                </div>
                            </div>
                            <div id="select-ing" class="control-group">
                                <label class="control-label" >Ingredientes ya elegidos</label>
                                <div id="ingredients-list">
                                    <ul>
                                        <g:each in="${recipeComponents}" var="comp">
                                            <div class="ingredient-row">
                                                <div class="alert token-ingredient">${comp.qty} ${comp.unit.name}  ${comp.ingredient.name}</div>
                                            </div>
                                        </g:each>
                                    </ul>
                                </div>
                                <div class="controls ">
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="steps">Contanos los pasos a seguir</label>
                                <div class="controls">
                                    <textarea id="descrip" class="input-xlarge" id="steps" rows="4">${recipe.description}</textarea>
                                    <p class="help-block"><span id="counter" class="badge">500</span> caracteres restantes</p>
                                    <div class="alert alert-error help-block alert-desc">Superaste los 500 caracteres permitidos</div>
                                </div>
                            </div>
                        </fieldset>
                        <div id="temporary" style="display: none;" class="alert alert-info help-block"></div>
                        <div class="form-actions">
                            <!--input type="button" onclick="loadTab('1')" name="create" value="Anterior" class="button-form"-->
                            <input type="button" name="create" value="Crear" class="button-form" id="submit-but"/>
                        </div>


                    </div>
                  </div>
                </div>




              </div>


            </form>

        </div>
      </div>

		<!-- Model Crear ingrediente -->
	<div class="modal hide" id="ingredientModal">
	  <div class="modal-header">
	    <button type="button" class="close" data-dismiss="modal">×</button>
	    <h3>Crear ingrediente</h3>
	  </div>
	  <div class="modal-body">
		<form id="ingredientForm" class="form-horizontal wte-form" action="/ingredient/save" method="post">
		  <fieldset>
			<div class="control-group">
				<label class="control-label" for="title">Nombre de ingrediente</label>
				<div class="controls">
					<input type="text" autocomplete="off" class="input-xlarge" id="name" name="name" maxlength="100">
				</div>
			</div>
		   </fieldset>
		</form>
	  </div>
	  <div class="modal-footer">
	    <a href="#" class="btn" data-dismiss="modal">Cancelar</a>
	    <a id="btnCreateIngredient"href="#" class="btn btn-primary">Crear</a>
	  </div>
	</div>

	<content tag="js">
  <script type="text/javascript">
      $(document).ready(function() {
        $("#ingred").tokenInput("/ingredient/getRelatedForCreation/", {
            theme: "recepy",
            tokenLimit:1,
            listId:""
        });
		$("#tab2Alert").alert();
		$("#btnIngredientModal").click(function(){
			//$("form#ingredientForm input#name").val($("form#recipeForm input#ingred").val());
			$("#tab2Alert").hide();
			$('#ingredientModal').modal('show');
		});
		$("#btnCreateIngredient").click(function(){
			$.ajax({
			  type: "POST",
			  url: "/ingredient/save?" + $("#ingredientForm").serialize()
			}).done(function( msg ) {
			  $("#tab2Alert").html(msg);
			  $("form#ingredientForm input#name").val("");
			  $("#tab2Alert").show();
			  $("#ingred").tokenInput("flush");
			  $('#ingredientModal').modal('hide');
			});	
		});
      });
  </script>
  <script src="/js/recipe.js" type="text/javascript"></script>
	</content>

  </body>
</html>