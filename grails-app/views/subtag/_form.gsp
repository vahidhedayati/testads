<%@ page import="dms.nexusglobal.Subtag" %>



<div class="fieldcontain ${hasErrors(bean: subtagInstance, field: 'subtagName', 'error')} ">
	<label for="subtagName">
		<g:message code="subtag.subtagName.label" default="Subtag Name" />
		
	</label>
	<g:textField name="subtagName" value="${subtagInstance?.subtagName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: subtagInstance, field: 'tag', 'error')} required">
	<label for="tag">
		<g:message code="subtag.tag.label" default="Tag" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tag" name="tag.id" from="${dms.nexusglobal.Tag.list()}" optionKey="id" required="" value="${subtagInstance?.tag?.id}" class="many-to-one"/>

</div>

