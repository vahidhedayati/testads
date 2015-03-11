<%@ page import="ajaxdependancyselectexample.MyBorough" %>



<div class="fieldcontain ${hasErrors(bean: myBoroughInstance, field: 'actualName', 'error')} ">
	<label for="actualName">
		<g:message code="myBorough.actualName.label" default="Actual Name" />
		
	</label>
	<g:textField name="actualName" value="${myBoroughInstance?.actualName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: myBoroughInstance, field: 'streets', 'error')} ">
	<label for="streets">
		<g:message code="myBorough.streets.label" default="Streets" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${myBoroughInstance?.streets?}" var="s">
    <li><g:link controller="streets" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="streets" action="create" params="['myBorough.id': myBoroughInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'streets.label', default: 'Streets')])}</g:link>
</li>
</ul>

</div>

