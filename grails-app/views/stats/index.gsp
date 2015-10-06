<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'question.label', default: 'Question')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>


	</head>

	<body>
		<a href="#list-question" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		
		<h2>User: ${fieldValue(bean: profileInstance, field: "userName")}</h2>
		<h2>email: ${fieldValue(bean: profileInstance, field: "email")}</h2>
		<h2>Puntaje Total: ${fieldValue(bean: profileInstance, field: "totalScore")}</h2>
		<h2>Cantidad de partidas: ${cantidadInstance}</h2>
		<div id="list-question" class="content scaffold-list" role="main">
			<h1>Ultimas Partidas</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						
						
						<g:sortableColumn property="Puntaje" title="${message(code: 'question.answer1.label', default: 'score')}" />
					
						<g:sortableColumn property="result" title="${message(code: 'question.answer2.label', default: 'result')}" />
					
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${currentGameInstanceList1}" status="i" var="currentGameInstance1">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: currentGameInstance1, field: "score")}</td>
					
						<td>${fieldValue(bean: currentGameInstance1, field: "result")}</td>
					
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${questionInstanceCount ?: 0}" />
			</div>
		</div>
		
		<div id="list-question" class="content scaffold-list" role="main">
			<h1>Top-Scores</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						
						<g:sortableColumn property="Usuario" title="${message(code: 'question.answer1.label', default: 'usuario')}" />
						
						<g:sortableColumn property="Puntaje" title="${message(code: 'question.answer1.label', default: 'score')}" />
					
						<g:sortableColumn property="result" title="${message(code: 'question.answer2.label', default: 'result')}" />
					
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${currentGameInstanceList2}" status="i" var="currentGameInstance2">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: currentGameInstance2, field: "user.userName")}</td>
					
						<td>${fieldValue(bean: currentGameInstance2, field: "score")}</td>
					
						<td>${fieldValue(bean: currentGameInstance2, field: "result")}</td>
					
					
					</tr>
				</g:each>
				</tbody>
			</table>
		</div>
	</body>
	

</html>
