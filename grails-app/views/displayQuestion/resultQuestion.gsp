<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="displayQuestion">
	</head>

	<body>
		<div class="panel-group">
			<div class="panel panel-default">
				<div class="panel-heading">
					<g:if test="${currentInstance.statusQues =='true'}">
		    			<h1 style="color:green;">Pregunta Correcta</h1>
					</g:if>
					<g:if test="${currentInstance.statusQues =='false'}">
						<h1 style="color:red;">Pregunta Incorrecta</h1>
					</g:if>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-sm-8" >
							<g:if test="${currentInstance.statusQues =='true'}">
		    					<asset:image src="minion-dance.gif" alt="Butter Game" height="300"/>
							</g:if>
							<g:if test="${currentInstance.statusQues =='false'}">
								<asset:image src="minion-fight.gif" alt="Butter Game" height="300"/>
							</g:if>
						</div>
						<div class="col-sm-4">
							<h3 >Calificar pregunta:</h3>
							<div class="row">
									<a id="1" class="btn btn-primary" href="${createLink(action: 'scoreOne')}">1</a>
									<a id="2" class="btn btn-primary" href="${createLink(action: 'scoreTwo')}">2</a>
									<a id="3" class="btn btn-primary" href="${createLink(action: 'scoreThree')}">3</a>
									<a id="4" class="btn btn-primary" href="${createLink(action: 'scoreFour')}">4</a>
									
							</div>
							<a href="${createLink(action: 'denuncia')}"class="btn btn-danger" style="margin-top:15%;">Denunciar</a>
						</div>
					</div>
					<g:if test="${currentInstance.statusQues =='false'}">
						<h1>La pregunta correcta es: ${currentInstance.correctAns}</h1>
					</g:if>
					
					<g:if test="${gameInstance.numQuestion == 5}">
						<a href="${createLink(action: 'nextQuestion')}" class="btn btn-primary btn-lg" role="button" style="margin-top:5px;">Puntaje final</a>
					</g:if>
					<g:if test="${gameInstance.numQuestion < 5}">
						<a href="${createLink(action: 'nextQuestion')}" class="btn btn-primary btn-lg" role="button" style="margin-top:5px;">Siguiente pregunta</a>
					</g:if>
				</div>
			</div>
		</div>
		<script>
		$('#radio').change(
		  function(){
		    $('.h3').text( this.value + ' stars' );
		  } 
		)
		
		</script>
	</body>
</html>