<%@ page import="ajaxdependancyselectexample.Offices" %>



<div class="fieldcontain ${hasErrors(bean: officesInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="offices.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${officesInstance?.name}"/>
</div>

