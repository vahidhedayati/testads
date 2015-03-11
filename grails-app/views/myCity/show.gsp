
<%@ page import="ajaxdependancyselectexample.MyCity" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'myCity.label', default: 'MyCity')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-myCity" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-myCity" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list myCity">
			
				<g:if test="${myCityInstance?.cityName}">
				<li class="fieldcontain">
					<span id="cityName-label" class="property-label"><g:message code="myCity.cityName.label" default="City Name" /></span>
					
						<span class="property-value" aria-labelledby="cityName-label"><g:fieldValue bean="${myCityInstance}" field="cityName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${myCityInstance?.myborough}">
				<li class="fieldcontain">
					<span id="myborough-label" class="property-label"><g:message code="myCity.myborough.label" default="Myborough" /></span>
					
						<g:each in="${myCityInstance.myborough}" var="m">
						<span class="property-value" aria-labelledby="myborough-label"><g:link controller="myBorough" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${myCityInstance?.mycountry}">
				<li class="fieldcontain">
					<span id="mycountry-label" class="property-label"><g:message code="myCity.mycountry.label" default="Mycountry" /></span>
					
						<span class="property-value" aria-labelledby="mycountry-label"><g:link controller="myCountry" action="show" id="${myCityInstance?.mycountry?.id}">${myCityInstance?.mycountry?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${myCityInstance?.shops}">
				<li class="fieldcontain">
					<span id="shops-label" class="property-label"><g:message code="myCity.shops.label" default="Shops" /></span>
					
						<g:each in="${myCityInstance.shops}" var="s">
						<span class="property-value" aria-labelledby="shops-label"><g:link controller="myShops" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:myCityInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${myCityInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
