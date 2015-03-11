
<%@ page import="dms.nexusglobal.Tag" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tag.label', default: 'Tag')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-tag" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-tag" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list tag">
			
				<g:if test="${tagInstance?.subtag}">
				<li class="fieldcontain">
					<span id="subtag-label" class="property-label"><g:message code="tag.subtag.label" default="Subtag" /></span>
					
						<g:each in="${tagInstance.subtag}" var="s">
						<span class="property-value" aria-labelledby="subtag-label"><g:link controller="subtag" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${tagInstance?.tagName}">
				<li class="fieldcontain">
					<span id="tagName-label" class="property-label"><g:message code="tag.tagName.label" default="Tag Name" /></span>
					
						<span class="property-value" aria-labelledby="tagName-label"><g:fieldValue bean="${tagInstance}" field="tagName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tagInstance?.template}">
				<li class="fieldcontain">
					<span id="template-label" class="property-label"><g:message code="tag.template.label" default="Template" /></span>
					
						<span class="property-value" aria-labelledby="template-label"><g:link controller="template" action="show" id="${tagInstance?.template?.id}">${tagInstance?.template?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:tagInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${tagInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
