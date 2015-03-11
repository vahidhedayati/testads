<%@ page import="dms.nexusglobal.Template" %>



<div class="fieldcontain ${hasErrors(bean: templateInstance, field: 'tag', 'error')} ">
	<label for="tag">
		<g:message code="template.tag.label" default="Tag" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${templateInstance?.tag?}" var="t">
    <li><g:link controller="tag" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="tag" action="create" params="['template.id': templateInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'tag.label', default: 'Tag')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: templateInstance, field: 'templateName', 'error')} ">
	<label for="templateName">
		<g:message code="template.templateName.label" default="Template Name" />
		
	</label>
	<g:textField name="templateName" value="${templateInstance?.templateName}"/>

</div>

