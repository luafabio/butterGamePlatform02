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
		<link rel="shortcut icon" href="${assetPath(src: 'favicon.png')}" type="image/x-ico">
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
		      <a class="navbar-brand" href="#">ButterGame</a>
		    </div>
		    <div>
		      <ul class="nav navbar-nav navbar-right">
		      	<li><a class="navbar-brand" >${session.user.userName}</a></li>
		        <li><g:link controller="User" action="logOut">Log out</g:link></li>
		      </ul>
		    </div>
		  </div>
		</nav>
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<div class="container text-center">
					<g:layoutBody/>
					<a class="btn btn-warning btn-lg pull-right" href="${createLink(uri: '/')}" >Abandonar Partida</a>
					<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
				</div>
			</div>
		</div>
	</body>