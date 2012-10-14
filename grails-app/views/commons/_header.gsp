<div class="navbar navbar-fixed-top">
  <div class="navbar-inner">
    <div class="container-fluid">
      <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </a>
      <a class="brand" href="/">HoyQueComemos</a>
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
		          <li><a href="/userInfo/edit">Perfil</a></li>
		          <li class="divider"></li>
		          <li><g:link controller='logout'>Cerrar sesión</g:link></li>
		     </ul>
      </div>
		<div class="btn-group pull-right">
			<form id="simpleSearchForm" action="/listRecipes/simpleSearch" method="GET">
				<input id="simpleSearchText" type="text" name="query" maxlength="300"/>
				<input id="lupaImg" type="image" src="/img/lupa.gif" alt="Buscar">
			</form>
		</div>
      <div class="nav-collapse">
        <ul class="nav">
	 		<li class="${pageProperty(name:'page.home')}"><a href="/">Inicio</a></li>
			<li class="${pageProperty(name:'page.ranking')}"><a href="/ranking/bestrecipes">Ranking</a></li>
			<sec:ifLoggedIn>
				<li class="${pageProperty(name:'page.myRecipes')}"><a href="/recipe/list">Mis Recetas</a></li>
			</sec:ifLoggedIn>
			<li class="${pageProperty(name:'page.contest')}"><a href="/concurso">Concurso del mes</a></li>
            <li class="${pageProperty(name:'page.help')}"><a href="/help">Ayuda y preguntas</a></li>
        </ul>
      </div><!--/.nav-collapse -->
    </div>
  </div>
</div>
