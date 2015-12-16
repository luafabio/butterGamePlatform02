
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
		    	
		    		<g:if test="${valInstance == 'true'}">
		    			<h1>Ranking de preguntas con mas denuncias</h1>
		    		</g:if>
		    		<g:if test="${valInstance == 'false'}">
		    			<h1>Ranking de preguntas mejor valoradas</h1>
		    		</g:if>
				</div>
			<g:if test="${flash.message}">
					<div class="col-sm-12">
						<p class="bg-success text-success" style="margin-top:2%;font-size:20px; padding-top: 1%;
padding-bottom: 1%;">${flash.message}</p>
					</div>
				</g:if>
			<div class="panel-body">
				<div class="table-responsive">
					<table class="table table-hover table-bordered">
						<thead>
							<tr>
								<g:if test="${valInstance == 'true'}"><g:sortableColumn property="numero" title="${message(code: 'question.answer1.label', default: '#')}" /></g:if>
								
								<g:sortableColumn property="question" title="${message(code: 'question.question.label', default: 'Pregunta')}" />
							
								<g:if test="${valInstance == 'true'}"><g:sortableColumn property="report" title="${message(code: 'question.answer1.label', default: 'Denuncias')}" /></g:if>
								<g:if test="${valInstance == 'false'}"><g:sortableColumn property="quality" title="${message(code: 'question.answer1.label', default: 'Valoracion')}" /></g:if>
							</tr>
						</thead>
						<tbody>
							<g:each in="${questionInstanceList}" status="i" var="questionInstance">
								<tr style="cursor: pointer;" class='clickable-row' data-href="${createLink(controller: 'question', action: 'show', id:"${questionInstance.id}")}">
									<g:if test="${valInstance == 'true'}"><td>${i+1}</td></g:if>
									
									
									<td>${fieldValue(bean: questionInstance, field: "question")}</td>
								
									<g:if test="${valInstance == 'true'}"><td>${fieldValue(bean: questionInstance, field: "report")}</td></g:if>
									<g:if test="${valInstance == 'false'}"><td>${questionInstance.quality}</td></g:if>
								</tr>
							</g:each>
						</tbody>
					</table>
					<div class="pagination">
						<g:paginate total="${questionInstanceCount ?: 0}" />
					</div>
					
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
