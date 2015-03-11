
<%@ page import="ajaxdependancyselectexample.Table2" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'table2.label', default: 'Table2')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-table2" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-table2" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list table2">
			
				<g:if test="${table2Instance?.bName}">
				<li class="fieldcontain">
					<span id="bName-label" class="property-label"><g:message code="table2.bName.label" default="BN ame" /></span>
					
						<span class="property-value" aria-labelledby="bName-label"><g:fieldValue bean="${table2Instance}" field="bName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${table2Instance?.tablea}">
				<li class="fieldcontain">
					<span id="tablea-label" class="property-label"><g:message code="table2.tablea.label" default="Tablea" /></span>
					
						<span class="property-value" aria-labelledby="tablea-label"><g:link controller="table1" action="show" id="${table2Instance?.tablea?.id}">${table2Instance?.tablea?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:table2Instance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${table2Instance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
