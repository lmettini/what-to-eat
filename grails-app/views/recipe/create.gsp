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
        <div class="row-fluid">
            <form class="form-horizontal wte-form">
              <div class="hero-unit-forms">

                <h2>Crea una Receta</h2>
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
                                    <input type="text" autocomplete="off" class="input-xlarge" id="title" maxlength="100">
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
                        <fieldset>
                            <div class="control-group">
                                <label class="control-label" for="ingred">Qué ingredientes lleva tu Receta?</label>
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

                                    <div class="alert alert-error help-block alert-ingred" id="ing-alert1">Debes completar todos los campos para ingresar un ingrediente</div>
                                    <div class="alert alert-error help-block alert-ingred" id="ing-alert2">Debes agregar al menos un ingrediente</div>
                                    <div class="alert alert-error help-block alert-ingred" id="ing-alert3">Ya ingresaste ese ingrediente</div>
                                </div>
                            </div>
                            <div id="select-ing" class="control-group">
                                <label class="control-label" >Ingredientes ya elegidos</label>
                                <div class="controls ">
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="steps">Cuentanos los pasos a seguir</label>
                                <div class="controls">
                                    <textarea id="descrip" class="input-xlarge" id="steps" rows="4"></textarea>
                                    <p class="help-block"><span id="counter" class="badge">200</span> caracteres restantes</p>
                                    <div class="alert alert-error help-block alert-desc">Superaste los 200 caracteres permitidos</div>
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


	<content tag="js">
  <script type="text/javascript">
      $(document).ready(function() {
        $("#ingred").tokenInput("/ingredient/getRelated/", {
            theme: "recepy",
            tokenLimit:1,
            listId:""

        });
      });
  </script>
  <script src="/js/recipe.js" type="text/javascript"></script>
	</content>

  </body>
</html>