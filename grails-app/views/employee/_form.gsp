<%@ page import="ajaxdependancyselectexample.Employee" %>



<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'department', 'error')} required">
	<label for="department">
		<g:message code="employee.department.label" default="Department" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="department" name="department.id" from="${ajaxdependancyselectexample.Departments.list()}" optionKey="id" required="" value="${employeeInstance?.department?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="employee.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${employeeInstance?.name}"/>
</div>

