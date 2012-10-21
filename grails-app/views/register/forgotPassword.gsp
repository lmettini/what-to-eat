<html>
<head>
	<meta name='layout' content='main'/>
	<title>Olvido su contraseña?</title>
</head>

<body>

	<div id='login' class="well">
		<div class='hero-unit-forms'>
				 <h2>Olvidaste tu contraseña?</h2>
				<g:if test="${flash.message!=null}">
					<div id="flashAlert" class="alert alert-error">${flash.message}</div>
				</g:if>
					<g:form action='forgotPassword' name="forgotPasswordForm" autocomplete='off'>

					<g:if test='${emailSent}'>
					<br/>
					El mail para reestablecer su contraseña ha sido enviado. Por favor chequee su cuenta de mail.
					</g:if>
					<g:else>

					<br/>
					<h4> Ingresa tu nombre de usuario y te enviaremos un link para que reinicies tu contraseña al mail que tenemos para tu cuenta.</h4>
					<br>
					<table>
						<tr>
							<td><label for="username">Nombre de usuario:</label></td>
							<td><g:textField name="username" size="100" /></td>
						</tr>
					</table>
					<br>
						<input type="submit" value="Reestablecer contraseña" id="reset_submit" class="btn btn-primary">
					</g:else>

					</g:form>
	
		</div>
	</div>

<script>
$(document).ready(function() {
	$('#username').focus();
});
</script>

</body>
</html>
