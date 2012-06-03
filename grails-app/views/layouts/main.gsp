<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title><g:layoutTitle default="Grails" /></title>
  		<link type="text/css" href="css/wte.css" rel="stylesheet" />
		<link type="text/css" href="css/jquery-ui/jquery-ui-1.8.20.custom.css" rel="stylesheet" />
		<g:javascript library="jquery-1.7.2.min" />
		<g:javascript library="jquery-ui-1.8.20.custom.min" />
		<g:javascript library="wte/wte.core" />
        <g:layoutHead />
    </head>
    <body>
		<div id="header">
			<g:render template="/commons/header" />
		</div>
		<div id="mainBody">
        	<g:layoutBody />
		</div>
		<div id="footer">
			<g:render template="/commons/footer" />
		</div>
    </body>
</html>