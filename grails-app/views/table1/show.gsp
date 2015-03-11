
<%@ page import="ajaxdependancyselectexample.Table1" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'table1.label', default: 'Table1')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-table1" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-table1" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list table1">
			
				<g:if test="${table1Instance?.aName}">
				<li class="fieldcontain">
					<span id="aName-label" class="property-label"><g:message code="table1.aName.label" default="AN ame" /></span>
					
						<span class="property-value" aria-labelledby="aName-label"><g:fieldValue bean="${table1Instance}" field="aName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${table1Instance?.tableb}">
				<li class="fieldcontain">
					<span id="tableb-label" class="property-label"><g:message code="table1.tableb.label" default="Tableb" /></span>
					
						<g:each in="${table1Instance.tableb}" var="t">
						<span class="property-value" aria-labelledby="tableb-label"><g:link controller="table2" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:table1Instance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${table1Instance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
