<html>
  <head>
 <meta name="layout" content="mainadmin">
    <title>Moderar receta</title>
  </head>  
<body>
  <div class="well">
    <div class="row-fluid">
        <form id="recipeForm"class="form-horizontal wte-form" action="/moderateRecipes/moderate/${recipe.id}" method="POST">
          <div class="hero-unit-forms">
            <h2>Moderar receta</h2>
            <br/>
			<g:hasErrors bean="${recipe}">
				<div id="flashAlert" class="alert alert-error">Debe completar todos los campos obligatorios</div>
			</g:hasErrors>
                    <fieldset>
						<input type="hidden" id="moderateAction" name="moderateAction" value="cancel">
						<input type="hidden" id="rejectDescription" name="rejectDescription" value="">
						
						<div class="control-group">
                            <label class="control-label"><strong>Titulo de la Receta</strong></label>
                            <div class="controls" style="margin-top: 5px;">
                                <span>${recipe.title}</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label"><strong>Resumen</strong></label>
                            <div class="controls" style="margin-top: 5px;">
                                <span id="summary">${recipe.summary}</span>
                            </div>
                        </div>
						  <div class="control-group">
                                <label class="control-label"><strong>Fotos</strong></label>
								<div class="controls">
                                      <ul id="imgListRec" >
										<g:each status="i" in="${recipe.images}" var="image">
											<li x-data-id="${image.id}"><img src="${image.thumbnail}"></li>
					  					</g:each>
                                    </ul>
									<input type="hidden" id="imgList" name="imgList" value="">
                           		</div>
                           </div>
                        <g:if test="${recipe.video}">
                            <div class="control-group">
                                <label><strong>Video</strong></label>
                                <div class="video-container">
                                    <object width="425" height="350"><param name="movie" value="${recipe.video}"><embed src="${recipe.video}" type="application/x-shockwave-flash" width="425" height="350"></object>
                                </div>
                            </div>
                            <br/>
                        </g:if>

                        <div class="control-group">
                                <label class="control-label"><strong>Descripcion</strong></label>
                                <div class="controls" style="margin-top: 5px;">
                                    <span class="input-xlarge" rows="4" id="descrip">${recipe.description}</span>
                                </div>
                            </div>
                    </fieldset>
                    <div class="form-actions">
                        <a id="approveBtn" href="#" class="btn button-accept-form">Aceptar</a>
						<a id="rejectBtn" href="#rejectModal" data-toggle="modal" class="btn button-form">Rechazar</a>
                        <a id="cancelBtn" href="/moderateRecipes" class="btn button-cancel">Cancelar</a>
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
                  <label class="control-label">Motivo de rechazo:</label>
                  <div class="controls">
						<select id="rejectSelect">
							<option>Titulo indebido</option>
							<option>Descripcion indebida</option>
							<option>Foto/Video con contenidos indebidos</option>
							<option>Foto/Video contiene marcas visibles</option>
							<option>La receta ya existe en el sitio</option>
						</select>
                  </div>
              </div>
	  </div>
	  <div class="modal-footer">
          <a id="rejectSubmit"href="#" class="btn btn-reject">Rechazar</a>
          <a href="#" data-dismiss="modal" class="btn btn-cancel">Cancelar</a>
      </div>
	</div>
	
	<content tag="js">
		 <script type="text/javascript">
		$('#cancelBtn').click(function() {
		  $("#moderateAction").val("cancel");
		  $('#recipeForm').submit();
		});
		$('#rejectSubmit').click(function() {
		  $("#moderateAction").val("reject");
		  $("#rejectDescription").val($("#rejectSelect").val());
		  $('#recipeForm').submit();
		});
		$('#approveBtn').click(function() {
			if ($("#summary").val().length > 200){
				$("#summaryDiv").show();
				return;
			}
			if ($("#descrip").val().length > 500){
				$("#descriptionDiv").show();
				return;
			}
			var imgs ="";
		    $("#imgListRec > li[x-data-id]").each(function(i){
		        if(i!=0)imgs+=",";
		        imgs += $(this).attr("x-data-id");
		    });
			$("#imgList").val(imgs);
			
		   $("#moderateAction").val("approve");			
		   $('#recipeForm').submit();
		});
		
		function updateSumaryCounter(){
		    var count = $("#summary").val().length;

		    if(count>200){
		        $("#summarycounter").addClass("badge-important");
		    } else{
		        $("#summarycounter").removeClass("badge-important");
		    }

		    $("#summarycounter").html(200-count);
		}

		$("#summary").keyup(function(){updateSumaryCounter()});

		$("#summary").keydown(function(){setTimeout(updateSumaryCounter,100)});
		
		
		function deteleImage(id){
		    $("li[x-data-id="+id+"]").remove();
		}
		
		
		function updateCounter(){
		    var count = $("#descrip").val().length;

		    if(count>500){
		        $("#counter").addClass("badge-important");
		    } else{
		        $("#counter").removeClass("badge-important");
		    }

		    $("#counter").html(500-count);
		}

		$("#descrip").keyup(function(){updateCounter()});

		$("#descrip").keydown(function(){setTimeout(updateCounter,100)});

		</script>
	</content>
</body>
</html>