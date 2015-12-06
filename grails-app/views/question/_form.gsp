<%@ page import="btg.game.Question" %>



<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'question', 'error')} required">
	<label for="question">
		<g:message code="question.question.label" default="Question" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="question" required="" value="${questionInstance?.question}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'answer1', 'error')} required">
	<label for="answer1">
		<g:message code="question.answer1.label" default="Answer1" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="answer1" required="" value="${questionInstance?.answer1}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'answer2', 'error')} required">
	<label for="answer2">
		<g:message code="question.answer2.label" default="Answer2" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="answer2" required="" value="${questionInstance?.answer2}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'answer3', 'error')} required">
	<label for="answer3">
		<g:message code="question.answer3.label" default="Answer3" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="answer3" required="" value="${questionInstance?.answer3}"/>

</div>



