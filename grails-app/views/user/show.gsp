
<%@ page import="btg.person.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="panel-group">
		    <div class="panel panel-default">
		    	<div class="panel-heading">
		    		<h1>Ver Usuario </h1>
				</div>
				<g:if test="${flash.message}">
					<div class="col-sm-12">
						<p class="bg-success text-success" style="margin-top:2%;font-size:20px; padding-top: 1%;
padding-bottom: 1%;">${flash.message}</p>
					</div>
				</g:if>
				<div class="panel-body">
					<asset:image src="minion-show.jpg" alt="Butter Game" height="300"/>
					
			
				<g:if test="${userInstance?.userName}">
				<h2 class="fieldcontain">
					<span id="userName-label" class="property-label"><g:message code="user.userName.label" default="Usuario" /></span>
					
						<span class="property-value" aria-labelledby="userName-label"><g:fieldValue bean="${userInstance}" field="userName"/></span>
					
				</h2>
				</g:if>
				<div class="col-md-offset-2 col-md-8">
					<form class="form-horizontal" role="form">
						<div class="form-group">
							<label  class="control-label col-md-5 "for="fullName">Nombre Completo: </label>
							<div class="col-md-7">
								<input  class="form-control" type="text" id="fullName" value="${userInstance?.fullName}" readonly>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-5 " for="email">e-mail: </label>
							<div class="col-md-7">
								<input class="form-control"  type="text" id="email" value="${userInstance?.email}" readonly>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-5" for="password">Contraseña: </label>
							<div class="col-md-7">
								<input class="form-control"  type="password" id="password" value="${userInstance?.password}" readonly>
							</div>
						</div>
					</form>
				
				
					<g:form url="[resource:userInstance, action:'delete']" method="DELETE">
						<fieldset class="buttons center-align">
							<a href="${createLink(action: 'edit',id:"${userInstance.id}")}" class="btn btn-link btn-lg" role="button">Editar</a>
							<button type="submit" class="btn btn-danger btn-lg" onclick="return confirm('${message(code: '¿Está seguro?', default: "¿Está seguro que desea eliminar al usuario ${userInstance?.userName}?")}');">Eliminar</button>
						</fieldset>
					</g:form>
				</div>
			</div>
		</div>
		</div>
	</body>
</html>
