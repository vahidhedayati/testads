
<%@ page import="ajaxdependancyselectexample.MyContinent" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'myContinent.label', default: 'MyContinent')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-myContinent" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-myContinent" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list myContinent">
			
				<g:if test="${myContinentInstance?.continentName}">
				<li class="fieldcontain">
					<span id="continentName-label" class="property-label"><g:message code="myContinent.continentName.label" default="Continent Name" /></span>
					
						<span class="property-value" aria-labelledby="continentName-label"><g:fieldValue bean="${myContinentInstance}" field="continentName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${myContinentInstance?.mycountry}">
				<li class="fieldcontain">
					<span id="mycountry-label" class="property-label"><g:message code="myContinent.mycountry.label" default="Mycountry" /></span>
					
						<g:each in="${myContinentInstance.mycountry}" var="m">
						<span class="property-value" aria-labelledby="mycountry-label"><g:link controller="myCountry" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${myContinentInstance?.id}" />
					<g:link class="edit" action="edit" id="${myContinentInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
