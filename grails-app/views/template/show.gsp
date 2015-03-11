
<%@ page import="dms.nexusglobal.Template" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'template.label', default: 'Template')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-template" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-template" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list template">
			
				<g:if test="${templateInstance?.tag}">
				<li class="fieldcontain">
					<span id="tag-label" class="property-label"><g:message code="template.tag.label" default="Tag" /></span>
					
						<g:each in="${templateInstance.tag}" var="t">
						<span class="property-value" aria-labelledby="tag-label"><g:link controller="tag" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${templateInstance?.templateName}">
				<li class="fieldcontain">
					<span id="templateName-label" class="property-label"><g:message code="template.templateName.label" default="Template Name" /></span>
					
						<span class="property-value" aria-labelledby="templateName-label"><g:fieldValue bean="${templateInstance}" field="templateName"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:templateInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${templateInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
