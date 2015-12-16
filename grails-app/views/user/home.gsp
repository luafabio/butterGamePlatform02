<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Butter Game</title>
		
		
	<body>
 
		 <!-- <nav class="navbar navbar-inverse">
		  <div class="container-fluid">
		    <div class="navbar-header">
		      <a class="navbar-brand" href="#">ButterGame</a>
		    </div>
		    <div>
		      <ul class="nav navbar-nav navbar-right">
		        <li class="active"><a href="#">Home</a></li>
		        <li><g:link controller="QuestionController">ABM Prguntas</g:link></li>
		        <li><g:link controller="EstadisticasController">Estadisticas</g:link></li>
		        <li><g:link controller="DisplayQuestionController">Juego</g:link></li>
		      </ul>
		    </div>
		  </div>
		</nav>-->
		
		  <div class="jumbotron" style="background-color: #FFFFFF;">
		  		<g:if test="${flash.message}">
					<div class="col-sm-12">
						<p class="bg-success text-success" style="margin-top:2%;font-size:20px; padding-top: 1%;
padding-bottom: 1%;">${flash.message}</p>
					</div>
				</g:if>
		    <h1><asset:image src="banana.png" alt="Butter Game" height="150"/>Butter Game</h1>
		    <p>Butter Game es un juego revolucionario que prueba la capacidad de la inteligencia humana llevando la mente del jugador a traspasar los limites de la cordura.</p>
		  </div>
		  <a href="<g:createLink controller="DisplayQuestion"/>" class="btn btn-primary btn-lg" role="button">Jugar</a>
		  
		  
		
		
		