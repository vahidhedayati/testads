
<%@ page import="ajaxdependancyselectexample.Departments" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'departments.label', default: 'Departments')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-departments" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-departments" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list departments">
			
				<g:if test="${departmentsInstance?.documents}">
				<li class="fieldcontain">
					<span id="documents-label" class="property-label"><g:message code="departments.documents.label" default="Documents" /></span>
					
						<g:each in="${departmentsInstance.documents}" var="d">
						<span class="property-value" aria-labelledby="documents-label"><g:link controller="documents" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${departmentsInstance?.employees}">
				<li class="fieldcontain">
					<span id="employees-label" class="property-label"><g:message code="departments.employees.label" default="Employees" /></span>
					
						<g:each in="${departmentsInstance.employees}" var="e">
						<span class="property-value" aria-labelledby="employees-label"><g:link controller="employee" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${departmentsInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="departments.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${departmentsInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${departmentsInstance?.offices}">
				<li class="fieldcontain">
					<span id="offices-label" class="property-label"><g:message code="departments.offices.label" default="Offices" /></span>
					
						<g:each in="${departmentsInstance.offices}" var="o">
						<span class="property-value" aria-labelledby="offices-label"><g:link controller="offices" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:departmentsInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${departmentsInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
