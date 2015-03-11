<%@ page import="dms.nexusglobal.Tag" %>



<div class="fieldcontain ${hasErrors(bean: tagInstance, field: 'subtag', 'error')} ">
	<label for="subtag">
		<g:message code="tag.subtag.label" default="Subtag" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${tagInstance?.subtag?}" var="s">
    <li><g:link controller="subtag" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="subtag" action="create" params="['tag.id': tagInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'subtag.label', default: 'Subtag')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: tagInstance, field: 'tagName', 'error')} ">
	<label for="tagName">
		<g:message code="tag.tagName.label" default="Tag Name" />
		
	</label>
	<g:textField name="tagName" value="${tagInstance?.tagName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: tagInstance, field: 'template', 'error')} required">
	<label for="template">
		<g:message code="tag.template.label" default="Template" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="template" name="template.id" from="${dms.nexusglobal.Template.list()}" optionKey="id" required="" value="${tagInstance?.template?.id}" class="many-to-one"/>

</div>

