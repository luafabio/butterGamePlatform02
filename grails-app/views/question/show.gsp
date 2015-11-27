
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
		    		<p style="text-align:left;float:left;"><g:link action="index"><asset:image src="volver.png" height="55"/></g:link>
					<h1>Ver Pregunta</h1>

				</div>
				<g:if test="${flash.message}">
					<div class="col-sm-12">
						<p class="bg-success text-success" style="margin-top:2%;font-size:20px; padding-top: 1%;
padding-bottom: 1%;">${flash.message}</p>
					</div>
				</g:if>
				<div class="panel-body">
					<asset:image src="minion-show.jpg" alt="Butter Game" height="300"/>
					
					<g:if test="${questionInstance?.question}">
					<h2 class="fieldcontain">
						<span id="question-label" class="property-label">Pregunta: </span>
							
						<span class="property-value" aria-labelledby="question-label"><g:fieldValue bean="${questionInstance}" field="question"/></span>
						
					</h2>
					</g:if>
					<div class="col-sm-offset-3 col-sm-6">
					<form class="form-horizontal" role="form">
						<div class="form-group">
							<label  class="control-label col-sm-5 "for="answ1">Respuesta Correcta: </label>
							<div class="col-sm-7">
								<input  class="form-control" type="text" id="answ1" value="${questionInstance?.answer1}" readonly>
							</div>
						</div>
						<div class="form-group">
							<label  class="control-label col-sm-5 "for="answ2">Respuesta Incorrecta 1: </label>
							<div class="col-sm-7">
								<input  class="form-control" type="text" id="answ2" value="${questionInstance?.answer2}" readonly>
							</div>
						</div>
						<div class="form-group">
							<label  class="control-label col-sm-5 "for="answ3">Respuesta Incorrecta 2: </label>
							<div class="col-sm-7">
								<input  class="form-control" type="text" id="answ3" value="${questionInstance?.answer3}" readonly>
							</div>
						</div>
					</form>
					<g:form url="[resource:questionInstance, action:'delete']" method="DELETE">
						<fieldset class="buttons">
							<a href="${createLink(action: 'edit',id:"${questionInstance.id}")}" class="btn btn-link btn-lg" role="button">Editar</a>
							<button type="submit" class="btn btn-danger btn-lg" onclick="return confirm('${message(code: '¿Está seguro?', default: "¿Está seguro que desea eliminar la pregunta: ${questionInstance?.question}?")}');">Eliminar</button>
						</fieldset>
					</g:form>
				</div>
			</div>
		</div>
	</div>
	</body>
</html>
