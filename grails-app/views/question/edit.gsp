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
		    		<h1>Editar Pregunta</h1>
				</div>
				<g:if test="${flash.message}">
					<div class="col-sm-12">
						<p class="bg-success text-success" style="margin-top:2%;font-size:20px; padding-top: 1%;
padding-bottom: 1%;">${flash.message}</p>
					</div>
				</g:if>
				<g:hasErrors bean="${questionInstance}">
					<div class="col-sm-12">
						<g:eachError bean="${questionInstance}" var="error">
							<p class="bg-danger text-danger" style="margin-top:2%;font-size:20px; padding-top: 1%;
padding-bottom: 1%;"<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></p>
						</g:eachError>
					</div>
					
				</g:hasErrors>
				<div class="panel-body">
					<asset:image src="minion-edit.jpg" alt="Butter Game" height="300"/>
					
					<g:form url="[resource:questionInstance, action:'update']" method="PUT" class="form-horizontal" role="form">
						<g:hiddenField name="version" value="${questionInstance?.version}" />
						<div class="col-md-offset-2 col-md-8">
							
								<div class="form-group">
									<label class="control-label" for="question">Pregunta: </label>
  									<div class="col-md-12">
  										<textarea class="form-control" rows="2" id="question" name="question">${questionInstance?.question}</textarea>
									</div>
								</div>
								<div class="form-group">
									<label  class="control-label col-md-6 " for="answer1" style="padding-left: 0%;">Respuesta Correcta: </label>
									<div class="col-md-6">
										<input  class="form-control"  type="text" id="answer1"  name="answer1"value="${questionInstance?.answer1}" >
									</div>
								</div>
								
								<div class="form-group">
									<label  class="control-label col-md-6 "for="answer2" style="padding-left: 0%;">Respuesta Incorrecta 1: </label>
									<div class="col-md-6">
										<input  class="form-control"  type="text" id="answer2"  name="answer2"value="${questionInstance?.answer2}" >
									</div>
								</div>
								
								<div class="form-group">
									<label  class="control-label col-md-6 "for="answer3"style="padding-left: 0%;" >Respuesta Incorrecta 2: </label>
									<div class="col-md-6">
										<input  class="form-control"  type="text" id="answer3" name="answer3"value="${questionInstance?.answer3}" >
									</div>
								</div>
							
							<fieldset class="buttons" style="padding-top:4%">
								<button type="submit" class="btn btn-primary btn-lg" >Guardar</button>
							</fieldset>
						</div>
						
					</g:form>
				</div>
			</div>
		</div>
	</body>
</html>
