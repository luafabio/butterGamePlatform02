<%@ page import="btg.game.Question" %> %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'question.label', default: 'Question')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="panel-group">
		    <div class="panel panel-default">
		    	<div class="panel-heading">
		    		<p style="text-align:left;float:left;"><g:link action="index"><asset:image src="volver.png" height="55"/></g:link>
					<h1>Editar Pregunta</h1>
				</div>
				<g:if test="${flash.message}">
					<div class="message" role="status">${flash.message}</div>
				</g:if>
				<g:hasErrors bean="${questionInstance}">
					<ul class="errors" role="alert">
						<g:eachError bean="${questionInstance}" var="error">
						<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
						</g:eachError>
					</ul>
				</g:hasErrors>
				<div class="panel-body">
					<asset:image src="minion-edit.jpg" alt="Butter Game" height="300"/>
					<g:form url="[resource:questionInstance, action:'update']" method="PUT" >
						<g:hiddenField name="version" value="${questionInstance?.version}" />
						<fieldset class="form">
							<g:render template="form"/>
						</fieldset>
						<fieldset class="buttons">
							<button type="submit" class="btn btn-primary btn-md" >Guardar</button>
						</fieldset>
					</g:form>
				</div>
			</div>
		</div>
	</body>
</html>
