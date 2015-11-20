DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="panel-group">
		    <div class="panel panel-default">
		    	<div class="panel-heading">
		    		<p style="text-align:left;float:left;"><g:link action="home"><asset:image src="volver.png" height="55"/></g:link>
		    		<h1> Modificar contraseña</h1>
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
						<div class="row">
						<div class="col-md-4 ">	
							<asset:image src="minion-create.jpg" alt="Butter Game" height="200"/>
						</div>
						<div class="col-md-4 ">			
							<g:form url="[resource:modifyInstance, action:'submitModification']" >
								
								<label for="userName" class="sr-only">Nombre de Usuario</label>
								<input style="margin-top: 10px;" type="text" id="userName" name="userName" class="form-control" placeholder="Usuario" value="${session.user.userName}" disabled>
								<label for="password" class="sr-only">Antigua Contraseña</label>
								<input style="margin-top: 10px;" type="password" id="oldPassword" name="oldPassword" class="form-control" placeholder="Antigua Contraseña"  required autofocus>
								<label for="password" class="sr-only">Nueva Contraseña</label>
								<input style="margin-top: 10px;" type="password" id="newPassword" name="newPassword" class="form-control" placeholder="Nueva Contraseña"  required>
								<label for="confirmPassword" class="sr-only">Confirmar Nueva Contraseña</label>
								<input style="margin-top: 10px;" type="password" id="confirmPassword" name="confirmPassword" class="form-control" placeholder="Confirmar Nueva Contraseña"  required>
				
								<fieldset class="buttons" style="margin-top: 10px;">
									<button type="submit" class="btn btn-lg btn-primary btn-md">Modificar contraseña</button>
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
