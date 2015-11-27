<%@ page import="btg.person.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="panel-group">
		    <div class="panel panel-default">
		    	<div class="panel-heading">
		    		<p style="text-align:left;float:left;"><g:link action="index"><asset:image src="volver.png" height="55"/></g:link>
					<h1>Editar Usuario</h1>
				</div>
				<g:if test="${flash.message}">
					<div class="col-sm-12">
						<p class="bg-success text-success" style="margin-top:2%;font-size:20px; padding-top: 1%;
padding-bottom: 1%;">${flash.message}</p>
					</div>
				</g:if>
				<g:hasErrors bean="${userInstance}">
					<div class="col-sm-12">
						<g:eachError bean="${userInstance}" var="error">
						<p class="bg-danger text-danger" style="margin-top:2%;font-size:20px; padding-top: 1%;
padding-bottom: 1%;"<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></p>
						</g:eachError>
					</div>
				</g:hasErrors>
				<div class="panel-body">
					<asset:image src="minion-edit.jpg" alt="Butter Game" height="300"/>
					<g:form url="[resource:userInstance, action:'update']" method="PUT" >
						<g:hiddenField name="version" value="${userInstance?.version}" />
						<div class="col-sm-offset-3 col-sm-6">
							
								<div class="form-group">
									<label  class="control-label col-sm-5 text-right"style="margin-top: 2%;"for="userName">Usuario: </label>
									<div class="col-sm-7">
										<input  class="form-control" style="margin-top: 2%;" type="text" id="userName" name="userName" value="${userInstance?.userName}" >
									</div>
								</div>
								<div class="form-group">
									<label  class="control-label col-sm-5 text-right"style="margin-top: 2%;"for="fullName">Nombre Completo: </label>
									<div class="col-sm-7">
										<input  class="form-control" style="margin-top: 2%;" type="text" id="fullName" name="fullName" value="${userInstance?.fullName}" >
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-5 text-right" style="margin-top: 2%;"for="email">e-mail: </label>
									<div class="col-sm-7">
										<input class="form-control" style="margin-top: 2%;" type="text" name="email" id="email" value="${userInstance?.email}" >
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-5 text-right" style="margin-top: 2%;"for="password">Contraseña: </label>
									<div class="col-sm-7">
										<input class="form-control" style="margin-top: 2%;" type="password" name="password" id="password" value="${userInstance?.password}" >
										<g:if test="${session.user.root}" ><input type="hidden" id="confirmPassword" name="confirmPassword" value="${userInstance?.password}"></g:if> 
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
