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
							<h3 >Calificar pregunta</h3>
							<div class="row">
								<span class="star-rating" style="margin-top:10%;">
									<input type="radio" name="rating" value="1"><i></i>
									<input type="radio" name="rating" value="2"><i></i>
									<input type="radio" name="rating" value="3"><i></i>
									<input type="radio" name="rating" value="4"><i></i>
									<input type="radio" name="rating" value="5"><i></i>
								</span>
							</div>
							<a class="btn btn-danger" href="#" style="margin-top:15%;">Denunciar</a>
						</div>
					</div>
					<a href="${createLink(action: 'nextQuestion')}" class="btn btn-link btn-lg" role="button" style="margin-top:5px;">Siguiente pregunta</a>
				</div>
			</div>
		</div>
		<script>
		$(':radio').change(
				  function(){
				    $('.h3').text( this.value + ' stars' );
				  } 
				)
		</script>
	</body>
</html>