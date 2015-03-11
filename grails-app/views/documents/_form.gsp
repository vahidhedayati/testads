<%@ page import="ajaxdependancyselectexample.Documents" %>



<div class="fieldcontain ${hasErrors(bean: documentsInstance, field: 'department', 'error')} required">
	<label for="department">
		<g:message code="documents.department.label" default="Department" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="department" name="department.id" from="${ajaxdependancyselectexample.Departments.list()}" optionKey="id" required="" value="${documentsInstance?.department?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: documentsInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="documents.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${documentsInstance?.name}"/>
</div>

