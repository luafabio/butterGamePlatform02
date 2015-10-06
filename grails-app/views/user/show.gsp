
<%@ page import="btg.person.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="user">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="panel-group">
		    <div class="panel panel-default">
		    	<div class="panel-heading">
		    		<p style="text-align:left;float:left;"><g:link action="index"><asset:image src="volver.png" height="55"/></g:link>
					<h1>Ver User</h1>
				</div>
				<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
				</g:if>
			
			
				<g:if test="${userInstance?.userName}">
				<h2 class="fieldcontain">
					<span id="userName-label" class="property-label"><g:message code="user.userName.label" default="User Name" /></span>
					
						<span class="property-value" aria-labelledby="userName-label"><g:fieldValue bean="${userInstance}" field="userName"/></span>
					
				</h2>
				</g:if>
				<ol class="property-list user">
			
					<g:if test="${userInstance?.fullName}">
					<li class="fieldcontain">
						<span id="fullName-label" class="property-label"><g:message code="user.fullName.label" default="Full Name" /></span>
						
							<span class="property-value" aria-labelledby="fullName-label"><g:fieldValue bean="${userInstance}" field="fullName"/></span>
						
					</li>
					</g:if>
				
					<g:if test="${userInstance?.email}">
					<li class="fieldcontain">
						<span id="email-label" class="property-label"><g:message code="user.email.label" default="Email" /></span>
						
							<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${userInstance}" field="email"/></span>
						
					</li>
					</g:if>
				
					<g:if test="${userInstance?.password}">
					<li class="fieldcontain">
						<span id="password-label" class="property-label"><g:message code="user.password.label" default="Password" /></span>
						
							<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${userInstance}" field="password"/></span>
						
					</li>
					</g:if>
				
					<g:if test="${userInstance?.confirmPassword}">
					<li class="fieldcontain">
						<span id="confirmPassword-label" class="property-label"><g:message code="user.confirmPassword.label" default="Confirm Password" /></span>
						
							<span class="property-value" aria-labelledby="confirmPassword-label"><g:fieldValue bean="${userInstance}" field="confirmPassword"/></span>
						
					</li>
					</g:if>
			
				</ol>
				<g:form url="[resource:userInstance, action:'delete']" method="DELETE">
					<fieldset class="buttons">
						<a href="${createLink(action: 'edit',id:"${userInstance.id}")}" class="btn btn-link" role="button">Editar</a>
						<button type="submit" class="btn btn-danger btn-md" onclick="return confirm('${message(code: '¿Está seguro?', default: '¿Está seguro?')}');">Eliminar</button>
					</fieldset>
				</g:form>
			</div>
		</div>
	</body>
</html>
