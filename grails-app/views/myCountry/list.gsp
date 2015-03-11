
<%@ page import="ajaxdependancyselectexample.MyCountry" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'myCountry.label', default: 'MyCountry')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-myCountry" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-myCountry" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="ccode" title="${message(code: 'myCountry.ccode.label', default: 'Ccode')}" />
					
						<g:sortableColumn property="countryName" title="${message(code: 'myCountry.countryName.label', default: 'Country Name')}" />
					
						<g:sortableColumn property="language" title="${message(code: 'myCountry.language.label', default: 'Language')}" />
					
						<th><g:message code="myCountry.mycontinent.label" default="Mycontinent" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${myCountryInstanceList}" status="i" var="myCountryInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${myCountryInstance.id}">${fieldValue(bean: myCountryInstance, field: "ccode")}</g:link></td>
					
						<td>${fieldValue(bean: myCountryInstance, field: "countryName")}</td>
					
						<td>${fieldValue(bean: myCountryInstance, field: "language")}</td>
					
						<td>${fieldValue(bean: myCountryInstance, field: "mycontinent")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${myCountryInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
