
<%@ page import="ajaxdependancyselectexample.MyCountry" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'myCountry.label', default: 'MyCountry')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-myCountry" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-myCountry" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list myCountry">
			
				<g:if test="${myCountryInstance?.ccode}">
				<li class="fieldcontain">
					<span id="ccode-label" class="property-label"><g:message code="myCountry.ccode.label" default="Ccode" /></span>
					
						<span class="property-value" aria-labelledby="ccode-label"><g:fieldValue bean="${myCountryInstance}" field="ccode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${myCountryInstance?.countryName}">
				<li class="fieldcontain">
					<span id="countryName-label" class="property-label"><g:message code="myCountry.countryName.label" default="Country Name" /></span>
					
						<span class="property-value" aria-labelledby="countryName-label"><g:fieldValue bean="${myCountryInstance}" field="countryName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${myCountryInstance?.language}">
				<li class="fieldcontain">
					<span id="language-label" class="property-label"><g:message code="myCountry.language.label" default="Language" /></span>
					
						<span class="property-value" aria-labelledby="language-label"><g:fieldValue bean="${myCountryInstance}" field="language"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${myCountryInstance?.mycity}">
				<li class="fieldcontain">
					<span id="mycity-label" class="property-label"><g:message code="myCountry.mycity.label" default="Mycity" /></span>
					
						<g:each in="${myCountryInstance.mycity}" var="m">
						<span class="property-value" aria-labelledby="mycity-label"><g:link controller="myCity" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${myCountryInstance?.mycontinent}">
				<li class="fieldcontain">
					<span id="mycontinent-label" class="property-label"><g:message code="myCountry.mycontinent.label" default="Mycontinent" /></span>
					
						<span class="property-value" aria-labelledby="mycontinent-label"><g:link controller="myContinent" action="show" id="${myCountryInstance?.mycontinent?.id}">${myCountryInstance?.mycontinent?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:myCountryInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${myCountryInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
