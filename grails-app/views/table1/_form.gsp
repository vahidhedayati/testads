<%@ page import="ajaxdependancyselectexample.Table1" %>



<div class="fieldcontain ${hasErrors(bean: table1Instance, field: 'aName', 'error')} ">
	<label for="aName">
		<g:message code="table1.aName.label" default="AN ame" />
		
	</label>
	<g:textField name="aName" value="${table1Instance?.aName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: table1Instance, field: 'tableb', 'error')} ">
	<label for="tableb">
		<g:message code="table1.tableb.label" default="Tableb" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${table1Instance?.tableb?}" var="t">
    <li><g:link controller="table2" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="table2" action="create" params="['table1.id': table1Instance?.id]">${message(code: 'default.add.label', args: [message(code: 'table2.label', default: 'Table2')])}</g:link>
</li>
</ul>

</div>

