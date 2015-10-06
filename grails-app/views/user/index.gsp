
<%@ page import="btg.person.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="user">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="panel-group" >
		    <div class="panel panel-default" >
		    	<div class="panel-heading">
		    		<h1>Lista de Usuarios</h1>
				</div>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div class="panel-body">
				<div class="table-responsive">
					<table class="table table-hover table-bordered">
						<thead>
							<tr>
					
								<g:sortableColumn property="userName" title="${message(code: 'user.userName.label', default: 'User Name')}" />
							
								<g:sortableColumn property="fullName" title="${message(code: 'user.fullName.label', default: 'Full Name')}" />
							
								<g:sortableColumn property="email" title="${message(code: 'user.email.label', default: 'Email')}" />
							
								<g:sortableColumn property="password" title="${message(code: 'user.password.label', default: 'Password')}" />
							
							</tr>
						</thead>
						<tbody>
						<g:each in="${userInstanceList}" status="i" var="userInstance">
							<tr style="cursor: pointer;" class='clickable-row' data-href="${createLink(action: 'show', id:"${userInstance.id}")}">
					
								<td>${fieldValue(bean: userInstance, field: "userName")}</td>
							
								<td>${fieldValue(bean: userInstance, field: "fullName")}</td>
							
								<td>${fieldValue(bean: userInstance, field: "email")}</td>
							
								<td>************</td>
							
							</tr>
						</g:each>
						</tbody>
					</table>
				
					<div class="pagination">
						<g:paginate total="${userInstanceCount ?: 0}" />
					</div>
					<a href="${createLink(action: 'create')}" class="btn btn-primary btn-lg pull-right" role="button">Nuevo Usuario</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
