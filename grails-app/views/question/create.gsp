<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'question.label', default: 'Question')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		
		<div class="panel-group">
		    <div class="panel panel-default">
		    	<div class="panel-heading">
		    		<p style="text-align:left;float:left;"><g:link action="index"><asset:image src="volver.png" height="55"/></g:link>
		    		<h1> Crear Pregunta</h1>
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
					<div class="row">
						<div class="col-md-4 ">	
							<asset:image src="minion-create.jpg" alt="Butter Game" height="200"/>
						</div>
						<div class="col-md-4 ">		
							<g:form url="[resource:questionInstance, action:'save']" >
								<label for="question" class="sr-only">Pregunta</label>
								<textarea class="form-control" rows="3" name="question" id="question" placeholder="Pregunta"required autofocus></textarea> 
								<label for="answer1" class="sr-only">Respuesta 1</label>
								<input style="margin-top: 10px;" type="text" id="answer1" name="answer1" class="form-control" placeholder="Respuesta correcta" required autofocus>
								<label for="answer2" class="sr-only">Respuesta 2</label>
								<input style="margin-top: 10px;" type="text" id="answer2" name="answer2" class="form-control" placeholder="Respuesta incorrecta 1" required autofocus>
								<label for="answer3" class="sr-only">Respuesta 3</label>
								<input style="margin-top: 10px;" type="text" id="answer3" name="answer3" class="form-control" placeholder="Respuesta incorrecta 2" required autofocus>
								
								<fieldset class="buttons" style="margin-top: 10px;">
									<button type="submit" class="btn btn-lg btn-primary btn-md">Crear Pregunta</button>
								</fieldset>
							</g:form>
						</div>
						<div class="col-md-4 ">	
							<asset:image src="minion-create.jpg" alt="Butter Game" height="200"/>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
