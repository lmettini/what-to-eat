<html>
  <head>
 <meta name="layout" content="main">
    <title>Registrar de usuario</title>
  </head>  
  <div class="well">
	<div class="hero-unit-forms">
		<h2>Registrar usuario</h2>
    	<br/>
	<form class="form-horizontal wte-form" action="/userInfo/save" method="POST">
		<fieldset>
      		<div class="row-fluid">
	     		<div class="span5">
						<g:hasErrors bean="${user}">
						<g:if test="${user.username != null && user.username.trim().length() > 0}">
							<g:hasErrors bean="${user}" field="username">
					   			<div id="flashAlert" class="alert alert-error">El nombre de usuario ingresado ya está siendo usado por otro usuario.</div>
							</g:hasErrors>
						</g:if>
						<g:if test="${user.email != null && user.email.trim().length() > 0}">
							<g:hasErrors bean="${user}" field="email">
					   			<div id="flashAlert" class="alert alert-error">El email ingresado ya se encuentra registrado en el sitio.</div>
							</g:hasErrors>
						</g:if>
						<g:if test="${user.mustShowValidationError()}">					
							<div id="flashAlert" class="alert alert-error">Debe completar todos los campos obligatorios</div>
						</g:if>	
					</g:hasErrors>
					<g:if test="${wrongPassword}">
				   			<div id="flashAlert" class="alert alert-error">Debe ingresar 2 contraseñas iguales</div>
					</g:if>
                    <div class="control-group">
                            <label class="control-label" for="title">Nombre de usuario</label>
                            <div class="controls">
                                <input type="text" id="name" name="username" class="input-xlarge" maxlength="100" value="${user.username}">
							</div>
					</div>
                    <div class="control-group">
                            <label class="control-label" for="title">Nombre</label>
                            <div class="controls">
                                <input type="text" id="name" name="name" class="input-xlarge" maxlength="100" value="${user.name}">
                            </div>
                    </div>
                    <div class="control-group">
                            <label class="control-label" for="surname">Apellido</label>
                            <div class="controls">
                                 <input type="text" id="surname" name="surname" class="input-xlarge" maxlength="100" value="${user.surname}">
                            </div>
                        </div>
						<div class="control-group">
                            <label class="control-label" for="email">Email</label>
                            <div class="controls">
                                 <input type="text" id="email" name="email" class="input-xlarge" maxlength="100" value="${user.email}">
                            </div>
                        </div>
						<div class="control-group">
                            <label class="control-label" for="password">Contraseña</label>
                            <div class="controls">
                                 <input type="password" id="password" name="password" class="input-xlarge" maxlength="100" value="${user.password}">
                            </div>
                        </div>
							<div class="control-group">
	                            <label class="control-label" for="password2">Confirmar contraseña</label>
	                            <div class="controls">
	                                 <input type="password" id="password2" name="password2" class="input-xlarge" maxlength="100" value="${params.password2}">
	                            </div>
	                        </div>
						<div class="control-group">
	                         <label class="control-label" for="mailPublic">Hacer público mi mail</label>
	                          <div class="controls">
	                              <input type="checkbox" id="mailPublic" name="mailPublic" <g:if test="${user.mailPublic}">checked</g:if>>
		                      </div>
	                    </div>
				</div>
				<div class="span6">
					<div class="control-group">
	                         <label class="control-label">Avatar seleccionado:</label>
	                          <div class="controls">
							     	<img id="imgSelectedAavatar" src="/img/avatars/avatar${user.avatar}.png" />
							 		<input type="hidden" id="inputAvatar" name="avatar" value="${user.avatar}">
		                      </div>
	                </div>
				</div>
			</div>
			<div class="row-fluid">
			   <div class="span10">
				   <label class="control-label">Seleccione un avatar:</label>
		 	   </div>
		    </div>
			<div class="row-fluid">
			   <div class="span10">
                   <div class="controls"> 
				     <g:each var="i" in="${ (1..<11) }">
					    <div class="span1"><img id="imgAvatar${i}" style="border: 2px solid #FFFFFF" src="/img/avatars/avatar${i}.png" onmouseover="javascript:overAvatar(${i});" onmouseout="javascript:outAvatar(${i});" onclick="javascript:selectAvatar(${i});" /></div>
				      </g:each>
				   </div>
		 	   </div>
		    </div>
			<div class="row-fluid">
			   <div class="span10">
				 	<div class="form-actions">
                        	<input type="submit" id="nxtFS" name="create" value="Registrar" class="button-form">
                            <a href="/" class="button-cancel btn" data-dismiss="modal">Cancelar</a>
                    	</div>
			     	</div>
		       </div>
    		</div>
    </fieldset>
 	</form>
	</div>
  </div>
	<content tag="js">
	<script type="text/javascript">
    		function overAvatar(nroAvt){
				$("#imgAvatar" + nroAvt).css("border","2px solid #FF0000");
			}
			function outAvatar(nroAvt){
				$("#imgAvatar" + nroAvt).css("border","2px solid #FFFFFF");
			}
			function selectAvatar(nroAvt){
				$("#imgSelectedAavatar").attr("src","/img/avatars/avatar" + nroAvt + ".png");
				$("#inputAvatar").val(nroAvt);
			}
	</script>
	</content>
</body>
</html>
