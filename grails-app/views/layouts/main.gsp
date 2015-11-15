<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> -->
		<title>Butter Game</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${assetPath(src: 'favicon.png')}" type="image/x-ico" style="background-color:black;">
		<link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
  		<asset:stylesheet src="application.css"/>
		<asset:javascript src="application.js"/>
		<g:layoutHead/>
	</head>
	<body style="background-color: #D8D8D8;">
 
		 <nav class="navbar navbar-inverse">
		  <div class="container-fluid">
		    <div class="navbar-header">
		      <a class="navbar-brand" href="${createLink(uri: '/')}" >Butter Game</a>
		    </div>
		    <div>
		      <ul class="nav navbar-nav navbar-right">
		      <g:if test="${request.getSession(false)?.user}"> 
		        <li><g:link controller="User" action="logOut">Log out</g:link></li>
		       </g:if>
		        
		      </ul>
		    </div>
		  </div>
		</nav>
		<div class="row" style="background-color: transparent;">
			<g:if test="${request.getSession(false)?.user}"> 
				<div class="col-sm-3">
			  	  <div class="sidebar-nav" >
			 	     <div class="navbar navbar-default" role="navigation">
			 	       <div class="navbar-header">
				          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-navbar-collapse">
				            <span class="sr-only">Toggle navigation</span>
				            <span class="icon-bar"></span>
				            <span class="icon-bar"></span>
				            <span class="icon-bar"></span>
				          </button>
				          <span class="visible-xs navbar-brand">Sidebar menu</span>
				        </div>
				        <div class="navbar-collapse collapse sidebar-navbar-collapse">
				          <ul class="nav navbar-nav">
				            <g:if test="${session.user.root}" ><li><g:link controller="Question">Ver Prguntas</g:link></li></g:if>
				            <g:if test="${session.user.root}" ><li><g:link controller="User">Ver Usuarios</g:link></li></g:if>
				            <g:if test="${session.user.root}" ><li><g:link controller="User" action="create">Create Admin User</g:link></li></g:if>
				            <li><g:link controller="Question" action="create">Nueva Pregunta</g:link></li>
				            <li><g:link controller="Stats">Estadisticas</g:link></li>
				            <li><g:link controller="DisplayQuestion">Jugar</g:link></li>
				          </ul>
				        </div><!--/.nav-collapse -->
				      </div>
				    </div>
				  </div>
			</g:if>
			<g:if test="${request.getSession(false)?.user}"> 
			  <div class="col-sm-9">
			</g:if>
			<g:if test="${request.getSession(true)?.user}"> 
			  <div class="col-sm-12">
			</g:if>
			    <div class="container text-center">
					<g:layoutBody/>
					<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
				</div>
			  </div>
			</div>
			 
			
		
	</body>