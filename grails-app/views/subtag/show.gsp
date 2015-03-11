
<%@ page import="dms.nexusglobal.Subtag" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'subtag.label', default: 'Subtag')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-subtag" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-subtag" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list subtag">
			
				<g:if test="${subtagInstance?.subtagName}">
				<li class="fieldcontain">
					<span id="subtagName-label" class="property-label"><g:message code="subtag.subtagName.label" default="Subtag Name" /></span>
					
						<span class="property-value" aria-labelledby="subtagName-label"><g:fieldValue bean="${subtagInstance}" field="subtagName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${subtagInstance?.tag}">
				<li class="fieldcontain">
					<span id="tag-label" class="property-label"><g:message code="subtag.tag.label" default="Tag" /></span>
					
						<span class="property-value" aria-labelledby="tag-label"><g:link controller="tag" action="show" id="${subtagInstance?.tag?.id}">${subtagInstance?.tag?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:subtagInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${subtagInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
