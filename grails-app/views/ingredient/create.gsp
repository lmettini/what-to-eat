<html>
<head>
	<meta name="layout" content="main">
	<title>Crear ingrediente</title>
</head>
<body>  
	<div class="well">
    	<div class="row-fluid">
        	<form class="form-horizontal wte-form" action="/ingredient/save" method="post">
          		<div class="hero-unit-forms">
            		<h2>Crear ingrediente</h2>
            		<br/>
                    <fieldset>
                        <div class="control-group">
                            <label class="control-label" for="title">Nombre de ingrediente</label>
                            <div class="controls">
                                <input type="text" autocomplete="off" class="input-xlarge" id="name" name="name" maxlength="100">
                            </div>
                        </div>
                    </fieldset>
                    <div class="form-actions">
                        <input type="submit" value="Crear" class="button-form">
                    </div>
                </div>
			</form>
		</div>
 	</div>
</body>
</html>