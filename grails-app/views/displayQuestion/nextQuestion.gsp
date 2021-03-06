
<%@ page import="btg.game.Question" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="displayQuestion">
		<g:set var="entityName" value="${message(code: 'question.label', default: 'Question')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="panel-group">
			    <div class="panel panel-default">
			    	<div class="panel-heading">
			    			
						<h1>Pregunta ${gameInstance.numQuestion }   <span class="text-right" id="miContador" style="color:red;float:right">10</span></h1>
						<!-- <h1  class="text-right" id="miContador" style="color:red">10</h1>-->
					</div>
					<g:if test="${flash.message}">
					<div class="message" role="status">${flash.message}</div>
					</g:if>
					
					<div class="panel-body">
						
						<g:if test="${questionInstance?.question}">
							
							<h2 style=" color:rgb(51, 122, 183);"><g:fieldValue bean="${questionInstance}" field="question"/></h2>
							
						</g:if>
						<div class="list-group ">
							<g:if test="${questionInstance?.answer1}">
							  <a href="<g:createLink action="isCorrectAnswerA" id="${questionInstance.id}"/>" class="list-group-item"><g:fieldValue bean="${questionInstance}" field="answer1"/></a>
							</g:if>
							<g:if test="${questionInstance?.answer1}">
							  <a href="<g:createLink action="isCorrectAnswerB" id="${questionInstance.id}"/>" class="list-group-item"><g:fieldValue bean="${questionInstance}" field="answer2"/></a>
							</g:if>
							<g:if test="${questionInstance?.answer1}">
							  <a href="<g:createLink action="isCorrectAnswerC" id="${questionInstance.id}"/>" class="list-group-item" ><g:fieldValue bean="${questionInstance}" field="answer3"/></a>
							</g:if>
						</div>
						
					  <div class="progress">
					  
					  <g:if test="${gameInstance.numQuestion  ==1}">
						    <div class="progress-bar progress-bar-striped active" role="progressbar"
						  aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width:20%">
						    ${gameInstance.numQuestion }/5
						  </div> 
					  </g:if>
					  
					  <g:if test="${gameInstance.numQuestion  ==2}">
					  		<div class="progress-bar progress-bar-striped active" role="progressbar"
						  aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:40%">
						    ${gameInstance.numQuestion }/5
						  </div> 
					  </g:if>
					  <g:if test="${gameInstance.numQuestion  ==3}">
					  		<div class="progress-bar progress-bar-striped active" role="progressbar"
						  aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width:60%">
						    ${gameInstance.numQuestion }/5
						  </div> 
						</g:if>
						<g:if test="${gameInstance.numQuestion  ==4}">
					  		<div class="progress-bar progress-bar-striped active" role="progressbar"
						  aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width:80%">
						    ${gameInstance.numQuestion }/5
						  </div> 
						</g:if>
						<g:if test="${gameInstance.numQuestion  ==5}">
					  		<div class="progress-bar progress-bar-striped active" role="progressbar"
						  aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width:100%">
						    ${gameInstance.numQuestion }/5
						  </div> 
						</g:if>    
					  </div>
					
				</div>
			</div>
		</div>
		<script type="text/javascript">
			var i = 10
			function miTimer(){
				setTimeout(
					function(){
						$('#miContador').text(i)
						i --
						if (i>0) 
							miTimer()
						else 
							otroTimer()
					}, 1000
				)
			}
			miTimer()
			
			function otroTimer(){ 
				if (${gameInstance.numQuestion }==1){ 
					location.replace(location.href.replace('index','isTimeOut')) 
				}else{ 
					location.replace(location.href.replace('nextQuestion','isTimeOut')) 
				} 
			}
   		</script>
</html>
