
<%@ page import="ajaxdependancyselectexample.MyShops" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'myShops.label', default: 'MyShops')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-myShops" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-myShops" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list myShops">
			
				<g:if test="${myShopsInstance?.mycity}">
				<li class="fieldcontain">
					<span id="mycity-label" class="property-label"><g:message code="myShops.mycity.label" default="Mycity" /></span>
					
						<span class="property-value" aria-labelledby="mycity-label"><g:link controller="myCity" action="show" id="${myShopsInstance?.mycity?.id}">${myShopsInstance?.mycity?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${myShopsInstance?.shopName}">
				<li class="fieldcontain">
					<span id="shopName-label" class="property-label"><g:message code="myShops.shopName.label" default="Shop Name" /></span>
					
						<span class="property-value" aria-labelledby="shopName-label"><g:fieldValue bean="${myShopsInstance}" field="shopName"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:myShopsInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${myShopsInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
