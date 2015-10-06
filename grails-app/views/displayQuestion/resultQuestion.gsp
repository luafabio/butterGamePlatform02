<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="displayQuestion">
	</head>

	<body>
		<div class="panel-group">
		<g:if test="${currentInstance.statusQues =='true'}">
		    <div class="panel panel-default">
		    	<div class="panel-heading">
					<h1 style="color:green;">Pregunta Correcta</h1>
				</div>
				<div class="panel-body">
					<asset:image src="minion-dance.gif" alt="Butter Game" height="300"/>
					<p>
						<g:link action="nextQuestion">Siguiente Pregunta</g:link>
					</p>
				</div>
			</div>
		</g:if>
		<g:if test="${currentInstance.statusQues =='false'}">
			<div class="panel panel-default">
		    	<div class="panel-heading">
					<h1 style="color:red;">Pregunta Incorrecta</h1>
				</div>
				<div class="panel-body">
					<asset:image src="minion-fight.gif" alt="Butter Game" height="300"/>
					
					<p>
					<g:link action="nextQuestion">Siguiente Pregunta</g:link>
					</p>
				</div>
			</div>
		</g:if>
		</div>
	</body>
</html>