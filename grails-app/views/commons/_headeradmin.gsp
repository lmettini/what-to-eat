<div class="navbar navbar-fixed-top">
  <div class="navbar-inner">
    <div class="container-fluid">
      <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </a>
      <a class="brand" href="/">HoyQueComemos - Backend</a>
      <div class="btn-group pull-right">
			<sec:ifLoggedIn>
			<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
	          <i class="icon-user"></i> Usuario: <sec:username/>
	          <span class="caret"></span>
	        </a>
      		</sec:ifLoggedIn>
			 <sec:ifNotLoggedIn>
		        <a class="btn dropdown-toggle" data-toggle="dropdown" href="/login">
		          <i class="icon-user"></i> Iniciar sesión
		          <span class="caret"></span>
		        </a>
		      </sec:ifNotLoggedIn>
 			 <ul class="dropdown-menu">
		          <li><a href="#">Perfil</a></li>
		          <li class="divider"></li>
		          <li><g:link controller='logout'>Cerrar sesión</g:link></li>
		     </ul>
      </div>
      <div class="nav-collapse">
        <ul class="nav">
	 		<li class="${pageProperty(name:'page.homeadmin')}"><a href="/admin">Inicio</a></li>
			<li class="${pageProperty(name:'page.recipes')}"><a href="/admin/recipes">Moderar Recetas</a></li>
     		<li class="${pageProperty(name:'page.ingredients')}"><a href="/admin/ingredients">Moderar Ingredientes</a></li>
        </ul>
      </div><!--/.nav-collapse -->
    </div>
  </div>
</div>