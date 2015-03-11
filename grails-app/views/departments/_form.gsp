<%@ page import="ajaxdependancyselectexample.Departments" %>



<div class="fieldcontain ${hasErrors(bean: departmentsInstance, field: 'documents', 'error')} ">
	<label for="documents">
		<g:message code="departments.documents.label" default="Documents" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${departmentsInstance?.documents?}" var="d">
    <li><g:link controller="documents" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="documents" action="create" params="['departments.id': departmentsInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'documents.label', default: 'Documents')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: departmentsInstance, field: 'employees', 'error')} ">
	<label for="employees">
		<g:message code="departments.employees.label" default="Employees" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${departmentsInstance?.employees?}" var="e">
    <li><g:link controller="employee" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="employee" action="create" params="['departments.id': departmentsInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'employee.label', default: 'Employee')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: departmentsInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="departments.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${departmentsInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: departmentsInstance, field: 'offices', 'error')} ">
	<label for="offices">
		<g:message code="departments.offices.label" default="Offices" />
		
	</label>
	<g:select name="offices" from="${ajaxdependancyselectexample.Offices.list()}" multiple="multiple" optionKey="id" size="5" value="${departmentsInstance?.offices*.id}" class="many-to-many"/>
</div>

