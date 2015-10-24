<%@ page import="btg.game.Question" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>End Game</title>
		
	</head>

	<body>
		<div class="jumbotron" style="background-color: #FFFFFF;">
			<h1>Termino el juego! Tu puntaje es: ${gameInstance.score} puntos</h1> 
			<asset:image src="carlton.gif" alt="Butter Game" height="300"/>
		</div>
			<a href="<g:createLink controller="DisplayQuestion"/>" class="btn btn-primary btn-lg" role="button">Volver a Jugar</a>
	</body>
</html>