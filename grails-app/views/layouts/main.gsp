<%@ page contentType="text/html;charset=UTF-8" %>
      <!--[if IE]>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
      <![endif]-->
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title><g:layoutTitle default="HoyQueComemos"/></title>
	<g:layoutHead />
  	<g:render template="/commons/styles" />
  </head>
  <body>
  		<g:render template="/commons/header" />

   		<div class="container-fluid">
				<g:layoutBody />
  				<g:render template="/commons/footer" />
    	</div>

 		<g:render template="/commons/js" />

	    <g:pageProperty name="page.js"/>
  </body>
</html>
