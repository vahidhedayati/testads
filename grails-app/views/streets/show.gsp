
<%@ page import="ajaxdependancyselectexample.Streets" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'streets.label', default: 'Streets')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-streets" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-streets" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list streets">
			
				<g:if test="${streetsInstance?.localborough}">
				<li class="fieldcontain">
					<span id="localborough-label" class="property-label"><g:message code="streets.localborough.label" default="Localborough" /></span>
					
						<span class="property-value" aria-labelledby="localborough-label"><g:link controller="myBorough" action="show" id="${streetsInstance?.localborough?.id}">${streetsInstance?.localborough?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${streetsInstance?.streetName}">
				<li class="fieldcontain">
					<span id="streetName-label" class="property-label"><g:message code="streets.streetName.label" default="Street Name" /></span>
					
						<span class="property-value" aria-labelledby="streetName-label"><g:fieldValue bean="${streetsInstance}" field="streetName"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:streetsInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${streetsInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
