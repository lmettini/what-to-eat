<html>
  <head>
 <meta name="layout" content="main">
    <title>Editar perfil de usuario</title>
  </head>  
  <div class="well">
    <div class="row-fluid">
        <form class="form-horizontal wte-form" action="/userInfo/update" method="POST">
          <div class="hero-unit-forms">
            <h2>Editar usuario</h2>
            <br/>
			<g:if test="${user.email != null && user.email.length() > 0}">
				<g:hasErrors bean="${user}" field="email">
			   <div id="flashAlert" class="alert alert-error">El email ingresado ya se encuentra registrado en el sitio</div>
				</g:hasErrors>
			</g:if>
			<g:hasErrors bean="${user}">
				<div id="flashAlert" class="alert alert-error">Debe completar todos los campos obligatorios</div>	
			</g:hasErrors>
                    <fieldset>
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
	                         <label class="control-label" for="mailPublic">Hacer público mi mail</label>
	                          <div class="controls">
	                              <input type="checkbox" id="mailPublic" name="mailPublic" <g:if test="${user.mailPublic}">checked</g:if>>
		                      </div>
	                    </div>
                    </fieldset>
                    <div class="form-actions">
                        <input type="submit" id="nxtFS" name="create" value="Guardar" class="button-form">
                    </div>
			</div>
        </form>
    </div>
  </div>
</body>
</html>