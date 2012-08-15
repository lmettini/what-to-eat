<html>

<head>
	<meta name='layout' content='main'/>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

	<title><g:message code='spring.security.ui.register.title'/></title>

	<link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon"/>

	<s2ui:resources module='register' />
	
</head>

<body>
	 <content tag="menu">
		 <li><a href="/">Inicio</a></li>
         <li><a href="/help">Ayuda y preguntas</a></li>
         <li><a href="#contact">Contactanos</a></li>
	</content>
<div class="well">
<p/>

<s2ui:form width='650' height='300' elementId='loginFormContainer'
           titleCode='spring.security.ui.register.description' center='true'>

<g:form action='register' name='registerForm'>

	<g:if test='${emailSent}'>
	<br/>
	<g:message code='spring.security.ui.register.sent'/>
	</g:if>
	<g:else>

	<br/>

	<table>
	<tbody>

		<s2ui:textFieldRow name='username' labelCode='user.username.label' bean="${command}"
                         size='40' labelCodeDefault='Nombre de usuario' value="${command.username}"/>

		<s2ui:textFieldRow name='email' bean="${command}" value="${command.email}"
		                   size='40' labelCode='user.email.label' labelCodeDefault='E-mail'/>

		<s2ui:passwordFieldRow name='password' labelCode='user.password.label' bean="${command}"
                             size='40' labelCodeDefault='Contraseña' value="${command.password}"/>

		<s2ui:passwordFieldRow name='password2' labelCode='user.password2.label' bean="${command}"
                             size='40' labelCodeDefault='Confirmar contraseña' value="${command.password2}"/>

	</tbody>
	</table>

	<s2ui:submitButton elementId='create' class='btn' form='registerForm' messageCode='spring.security.ui.register.submit'/>

	</g:else>

</g:form>

</s2ui:form>
</div>

<script>
$(document).ready(function() {
	$('#username').focus();
});
</script>

</body>
</html>
