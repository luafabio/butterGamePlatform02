
<%@ page import="btg.game.Question" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'question.label', default: 'Question')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="panel-group">
		    <div class="panel panel-default">
		    	<div class="panel-heading">
<%--		    		<p style="text-align:left;float:left;"><g:link action="index"><asset:image src="volver.png" height="55"/></g:link>--%>
					<h1>Ver Pregunta</h1>
				</div>
				<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
				</g:if>
				<div class="panel-body">
					<asset:image src="minion-show.jpg" alt="Butter Game" height="300"/>
					
					<g:if test="${questionInstance?.question}">
					<h2 class="fieldcontain">
						<span id="question-label" class="property-label">Pregunta: </span>
							
						<span class="property-value" aria-labelledby="question-label"><g:fieldValue bean="${questionInstance}" field="question"/></span>
						
					</h2>
					</g:if>
					<ul class="property-list question">
					
						
					
						<g:if test="${questionInstance?.answer1}">
						<li class="fieldcontain">
							<span id="answer1-label" class="property-label"><g:message code="question.answer1.label" default="Answer1" /></span>
							
								<span class="property-value" aria-labelledby="answer1-label"><g:fieldValue bean="${questionInstance}" field="answer1"/></span>
							
						</li>
						</g:if>
					
						<g:if test="${questionInstance?.answer2}">
						<li class="fieldcontain">
							<span id="answer2-label" class="property-label"><g:message code="question.answer2.label" default="Answer2" /></span>
							
								<span class="property-value" aria-labelledby="answer2-label"><g:fieldValue bean="${questionInstance}" field="answer2"/></span>
							
						</li>
						</g:if>
					
						<g:if test="${questionInstance?.answer3}">
						<li class="fieldcontain">
							<span id="answer3-label" class="property-label"><g:message code="question.answer3.label" default="Answer3" /></span>
							
								<span class="property-value" aria-labelledby="answer3-label"><g:fieldValue bean="${questionInstance}" field="answer3"/></span>
							
						</li>
						</g:if>
					
					
					</ul>
					<g:form url="[resource:questionInstance, action:'delete']" method="DELETE">
						<fieldset class="buttons">
							<a href="${createLink(action: 'edit',id:"${questionInstance.id}")}" class="btn btn-link" role="button">Editar</a>
							<button type="submit" class="btn btn-danger btn-md" onclick="return confirm('${message(code: '¿Está seguro?', default: '¿Está seguro?')}');">Eliminar</button>
							<a href="${createLink(action: 'reiniciar',id:"${questionInstance.id}")}" class="btn btn-link" role="button">Reiniciar contador</a>
						</fieldset>
					</g:form>
				</div>
			</div>
		</div>
	</body>
</html>
