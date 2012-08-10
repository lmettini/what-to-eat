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
                            <input type="button" onclick="loadTab('2')" name="create" value="Siguiente" class="button-form">

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
                                        <option>Medida</option>
                                        <option>cucharadas</option>
                                        <option>gramos</option>
                                        <option>paquetes</option>
                                        <option>litros</option>
                                    </select>
                                    <input type="button" onclick="loadTab('2')" name="create" value="Agregar" class="btn inline add-ing">
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" >Ingredientes ya elegidos</label>
                                <div class="controls ">
                                    <div class="alert token-ingredient">100 gr. Lentejas<button type="button" class="close" >×</button></div>
                                    <div class="alert token-ingredient">2 cuch. Pimienta<button type="button" class="close" >×</button></div>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="steps">Cuentanos los pasos a seguir</label>
                                <div class="controls">
                                    <textarea class="input-xlarge" id="steps" rows="4"></textarea>
                                </div>
                            </div>
                        </fieldset>
                        <div class="form-actions">
                            <!--input type="button" onclick="loadTab('1')" name="create" value="Anterior" class="button-form"-->
                            <input type="button" name="create" value="Crear" class="button-form">
                        </div>


                    </div>
                  </div>
                </div>




              </div>


            </form>

        </div>
      </div>



      <hr>
      <g:render template="/commons/footer" />
    </div><!--/.fluid-container-->

  <g:render template="/commons/js" />

  <script type="text/javascript">
      function loadTab(id){
          $("#t-"+id).click();
      }

          $(document).ready(function() {
            //$("#input-recp").tokenInput("http://shell.loopj.com/tokeninput/tvshows.php", {
            $("#ingred").tokenInput("/ingredient/getRelated/", {
                theme: "recepy",
                tokenLimit:1,
                listId:""

            });
        });
  </script>

  </body>
</html>