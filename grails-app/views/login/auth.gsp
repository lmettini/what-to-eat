<html>
<head>
	<meta name='layout' content='main'/>
	<title><g:message code="springSecurity.login.title"/></title>
</head>

<body>
<div id='login' class="well">
	<div class='hero-unit-forms'>
		 <h2>Iniciar Sesion</h2>
		<br>
        <g:if test='${flash.message}'>
            <strong><div class='alert alert-error'>${flash.message}</div></strong>
        </g:if>
		<form action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='off'>
			<p>
				<label for='username'>Nombre de usuario:</label>
				<input type='text' class='text_' name='j_username' id='username'/>
			</p>

			<p>
				<label for='password'>Contraseña:</label>
				<input type='password' class='text_' name='j_password' id='password'/>
			</p>
			<p>
				<input type='submit' class="btn btn-primary" id="submit" value='Iniciar Sesion'/>
			</p>
		</form>
			<p>
				<a href="/userInfo/create">Crear un nuevo usuario</a>
			</p>
	</div>
</div>
<script type='text/javascript'>
	<!--
	(function() {
		document.forms['loginForm'].elements['j_username'].focus();
	})();
	// -->
</script>
</body>
</html>
