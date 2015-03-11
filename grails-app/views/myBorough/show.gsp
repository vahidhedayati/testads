
<%@ page import="ajaxdependancyselectexample.MyBorough" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'myBorough.label', default: 'MyBorough')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-myBorough" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-myBorough" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list myBorough">
			
				<g:if test="${myBoroughInstance?.actualName}">
				<li class="fieldcontain">
					<span id="actualName-label" class="property-label"><g:message code="myBorough.actualName.label" default="Actual Name" /></span>
					
						<span class="property-value" aria-labelledby="actualName-label"><g:fieldValue bean="${myBoroughInstance}" field="actualName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${myBoroughInstance?.streets}">
				<li class="fieldcontain">
					<span id="streets-label" class="property-label"><g:message code="myBorough.streets.label" default="Streets" /></span>
					
						<g:each in="${myBoroughInstance.streets}" var="s">
						<span class="property-value" aria-labelledby="streets-label"><g:link controller="streets" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:myBoroughInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${myBoroughInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
