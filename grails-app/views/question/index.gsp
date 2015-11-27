
<%@ page import="btg.game.Question" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'question.label', default: 'Question')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>


	</head>

	<body>
		
		<div class="panel-group" >
		    <div class="panel panel-default" >
		    	<div class="panel-heading">
		    		<h1>Lista de Preguntas</h1>
				</div>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div class="panel-body">
				<div class="table-responsive">
					<table class="table table-hover table-bordered">
						<thead>
							<tr>
						
								<g:sortableColumn property="question" title="${message(code: 'question.question.label', default: 'Pregunta')}" />
							
								<g:sortableColumn property="answer1" title="${message(code: 'question.answer1.label', default: 'Respuesta 1')}" />
						
								<g:sortableColumn property="answer2" title="${message(code: 'question.answer2.label', default: 'Respuesta 2')}" />
						
								<g:sortableColumn property="answer3" title="${message(code: 'question.answer3.label', default: 'Respuesta 3')}" />
						
							</tr>
						</thead>
						<tbody>
							<g:each in="${questionInstanceList}" status="i" var="questionInstance">
								<tr style="cursor: pointer;" class='clickable-row' data-href="${createLink(action: 'show', id:"${questionInstance.id}")}">
								
									<td>${fieldValue(bean: questionInstance, field: "question")}</td>
								
									<td>${fieldValue(bean: questionInstance, field: "answer1")}</td>
								
									<td>${fieldValue(bean: questionInstance, field: "answer2")}</td>
								
									<td>${fieldValue(bean: questionInstance, field: "answer3")}</td>
								
								</tr>
							</g:each>
						</tbody>
					</table>
					<div class="pagination">
						<g:paginate total="${questionInstanceCount ?: 0}" />
					</div>
					<a href="${createLink(action: 'create')}" class="btn btn-primary btn-lg pull-right" role="button">Nueva Pregunta</a>
					
				</div>
			</div>
		</div>
	</div>
		
		<script>
		jQuery(document).ready(function($) {
		    $(".clickable-row").click(function() {
		        window.document.location = $(this).data("href");
		    });
		});
		</script>
	</body>
	

</html>
