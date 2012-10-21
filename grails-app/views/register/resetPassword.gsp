<html>
<head>
	<meta name='layout' content='main'/>
	<title>Reestablecer contraseña</title>
</head>

<body>
	<div id='login' class="well">
		<div class='hero-unit-forms'>
				 <h2>Reestablecer contraseña</h2>
				<br>
						<g:hasErrors bean="${command}" field="password2">
				   			<div id="flashAlert" class="alert alert-error">Ha ingresado dos contraseñas diferentes</div>
						</g:hasErrors>
					
	<g:form action='resetPassword' name='resetPasswordForm' autocomplete='off'>
	<g:hiddenField name='t' value='${token}'/>
	<h4>Ingrese su nueva contraseña</h4>
	<br>
	<input type="hidden" name="username" value="${command?.username}" id="username">
	<table>
		<tr>
			<td><label for="username">Contraseña:</label></td>
			<td><input type="password" name="password" value="${command?.password}" id="password"></td>
		</tr>
		<tr>
			<td><label for="username">Confirmar contraseña:</label></td>
			<td><input type="password" name="password2" value="${command?.password2}" id="password2"></td>
		</tr>
	</table>
	<br>
	<input type="submit" value="Reestablecer contraseña" id="reset_submit" class="btn btn-primary">

	</g:form>

	
		</div>
	</div>

<script>
$(document).ready(function() {
	$('#password').focus();
});
</script>

</body>
</html>
