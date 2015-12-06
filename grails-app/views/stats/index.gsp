<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'question.label', default: 'Question')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>


	</head>

	<body>
		<div class="panel-group" >
		    <div class="panel panel-default" >
		    	<div class="panel-heading">
		    		<h1>Estadisticas de Usuario</h1>
				</div>
				<g:if test="${flash.message}">
					<div class="message" role="status">${flash.message}</div>
				</g:if>
				<div class="panel-body">
			
					<h4><b>Usuario:</b> ${fieldValue(bean: profileInstance, field: "userName")}</h4>
					<h4><b>Email:</b> ${fieldValue(bean: profileInstance, field: "email")}</h4>
					<h4><b>Puntaje Total:</b> ${fieldValue(bean: profileInstance, field: "totalScore")}</h4>
					<h4><b>Cantidad de partidas:</b> ${cantidadInstance}</h4>
					<h4><b>Promedio:</b> ${eficienciaInstance} puntos</h4>
					
					<button style="margin-bottom: 10px;" type="button" class="btn btn-info" data-toggle="collapse" data-target="#ultimasPartidas">Ultimas Partidas</button>
					<div id="ultimasPartidas" class="collapse">
						<g:if test="${flash.message}">
							<div class="message" role="status">${flash.message}</div>
						</g:if>
						
						<div class="table-responsive">
							<table class="table table-hover table-bordered">
								<thead>
									<tr>
									
										<g:sortableColumn property="Fecha" title="${message(code: 'question.answer1.label', default: 'Fecha')}" />
								
										<g:sortableColumn property="Puntaje" title="${message(code: 'question.answer1.label', default: 'Puntaje')}" />
									
										<g:sortableColumn property="result" title="${message(code: 'question.answer1.label', default: 'Resultado')}" />
								
									</tr>
								</thead>
								<tbody>
									<g:each in="${currentGameInstanceList1}" status="i" var="currentGameInstance1">
										<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
											
											
											<td><g:formatDate format="yyyy-MM-dd HH:mm:ss" date="${currentGameInstance1.fecha}"/></td>
											
											<td>${fieldValue(bean: currentGameInstance1, field: "score")}</td>
										
											<g:if test="${currentGameInstance1.result == true}">
											     <td>Victoria</td>
											</g:if>
											<g:if test="${currentGameInstance1.result == false}">
											     <td>Derrota</td>
											</g:if>
										
										
										</tr>
									</g:each>
								</tbody>
							</table>
						</div>
					</div>
						
					  <button style="margin-bottom: 10px;" type="button" class="btn btn-info" data-toggle="collapse" data-target="#top-Scores">Top-Scores</button>
					  <div id="top-Scores" class="collapse">
					  	<g:if test="${flash.message}">
							<div class="message" role="status">${flash.message}</div>
						</g:if>
						<div class="table-responsive">
							<table class="table table-hover table-bordered">
								<thead>
									<tr>
										<g:sortableColumn property="Ranking" title="${message(code: 'question.answer1.label', default: 'Ranking')}" />
										<g:sortableColumn property="Usuario" title="${message(code: 'question.answer1.label', default: 'Usuario')}" />
										<g:sortableColumn property="Puntaje" title="${message(code: 'question.answer1.label', default: 'Puntaje Total')}" />
									</tr>
								</thead>
								<tbody>
									<g:each in="${currentGameInstanceList2}" status="i" var="currentGameInstance2">
										<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
											<td>${i+1}</td>
											<td>${fieldValue(bean: currentGameInstance2, field: "userName")}</td>
											<td>${fieldValue(bean: currentGameInstance2, field: "totalScore")}</td>
										</tr>
									</g:each>
								</tbody>
							</table>
						</div>
					  </div>
	
					</div>
				</div>
			</div>
		
	</body>
	

</html>
