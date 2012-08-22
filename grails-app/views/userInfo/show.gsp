<html>
  <head>
 <meta name="layout" content="main">
    <title>Ver perfil de usuario</title>
  </head>  
  <div class="well">
    <div class="row-fluid">
          <div class="hero-unit-forms">
            <h2>${user.username}</h2>
            <br/>
                        <div class="row-fluid">
                            <div class="span1">Nombre</div>
                            <div class="span8">${user.name}</div>
                        </div>
                        <div class="row-fluid">
	                        <div class="span1">Apellido</div>
                            <div class="span8">${user.surname}</div>
                        </div>
						<g:if test="${user.mailPublic}">
						 <div class="row-fluid">
		                        <div class="span1">Email</div>
	                            <div class="span8">${user.email}</div>
	                        </div>
						</g:if>               
			</div>
        </form>
    </div>
  </div>
</body>
</html>