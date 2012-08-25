<html>
  <head>
 <meta name="layout" content="mainadmin">
    <title>Moderar ingrediente</title>
  </head>  
<body>
  <div class="well">
    <div class="row-fluid">
        <form id="ingredientForm"class="form-horizontal wte-form" action="/moderateIngredients/moderate/${ingredient.id}" method="POST">
          <div class="hero-unit-forms">
            <h2>Moderar ingrediente</h2>
            <br/>
			<g:hasErrors bean="${ingredient}">
				<div id="flashAlert" class="alert alert-error">Debe completar todos los campos obligatorios</div>
			</g:hasErrors>
                    <fieldset>
						<input type="hidden" id="moderateAction" name="moderateAction" value="cancel">
						<input type="hidden" id="rejectDescription" name="rejectDescription" value="">
                        <div class="control-group">
                            <label class="control-label" for="title">Nombre</label>
                            <div class="controls">
                                <input type="text" id="name" name="name" class="input-xlarge" maxlength="100" value="${ingredient.name}">
                            </div>
                        </div>
                    </fieldset>
                    <div class="form-actions">
	 					<a id="cancelBtn" href="#" class="btn button-form">Cancelar</a>
						<a id="rejectBtn" href="#rejectModal" data-toggle="modal" class="btn button-form">Rechazar</a>
						<a id="approveBtn" href="#" class="btn button-form">Aceptar</a>
                    </div>
			</div>
        </form>
    </div>
  </div>

	<div id="rejectModal" class="modal hide fade">
	  <div class="modal-header">
	    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
	    <h3>Indique el motivo de rechazo</h3>
	  </div>
	  <div class="modal-body">
          	 <div class="control-group">
                  <label class="control-label" for="title">Motivo de rechazo:</label>
                  <div class="controls">
						<select id="rejectSelect">
							<option>Ingrediente indebido</option>
							<option>Ya existe ese ingrediente en el sitio</option>
						</select>
                  </div>
              </div>
	  </div>
	  <div class="modal-footer">
	    <a href="#" data-dismiss="modal" class="btn btn-primary">Cancelar</a>
		<a id="rejectSubmit"href="#" class="btn btn-primary">Rechazar</a>
	  </div>
	</div>
	
	<content tag="js">
		 <script type="text/javascript">
		$('#cancelBtn').click(function() {
		  $("#moderateAction").val("cancel");
		  $('#ingredientForm').submit();
		});
		$('#rejectSubmit').click(function() {
		  $("#moderateAction").val("reject");
		  $("#rejectDescription").val($("#rejectSelect").val());
		  $('#ingredientForm').submit();
		});
		$('#approveBtn').click(function() {
		   $("#moderateAction").val("approve");
		   $('#ingredientForm').submit();
		});
		</script>
	</content>
</body>
</html>