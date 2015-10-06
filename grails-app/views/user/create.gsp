<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="user">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
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
				<g:hasErrors bean="${userInstance}">
					<ul class="errors" role="alert">
						<g:eachError bean="${userInstance}" var="error">
							<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
						</g:eachError>
					</ul>
				</g:hasErrors>
				<div class="panel-body">
					<div class="row">
						<div class="col-m-2">
							<asset:image src="minion-create.jpg" alt="Butter Game" height="300"/>
						</div>
						<div class="col-m-8">			
							<g:form url="[resource:userInstance, action:'save']" >
								<fieldset class="form">
									<g:render template="form"/>
								</fieldset>
								<fieldset class="buttons">
									<button type="submit" class="btn btn-primary btn-md">Crear Usuario</button>
								</fieldset>
							</g:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
