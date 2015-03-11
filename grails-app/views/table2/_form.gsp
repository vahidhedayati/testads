<%@ page import="ajaxdependancyselectexample.Table2" %>



<div class="fieldcontain ${hasErrors(bean: table2Instance, field: 'bName', 'error')} ">
	<label for="bName">
		<g:message code="table2.bName.label" default="BN ame" />
		
	</label>
	<g:textField name="bName" value="${table2Instance?.bName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: table2Instance, field: 'tablea', 'error')} required">
	<label for="tablea">
		<g:message code="table2.tablea.label" default="Tablea" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tablea" name="tablea.id" from="${ajaxdependancyselectexample.Table1.list()}" optionKey="id" required="" value="${table2Instance?.tablea?.id}" class="many-to-one"/>
</div>

