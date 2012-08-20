<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title><g:layoutTitle default="ADMIN PANEL HoyQueComemos"/></title>
	<g:layoutHead />
  	<g:render template="/commons/styles" />
	<link href="/css/admin.css" rel="stylesheet">
  </head>
  <body>
  		<g:render template="/commons/headeradmin" />

   		<div class="container-fluid">
				<g:layoutBody />
  				<g:render template="/commons/footer" />
    	</div>

 		<g:render template="/commons/js" />

	    <g:pageProperty name="page.js"/>
  </body>
</html>
