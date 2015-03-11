
<%@ page import="ajaxdependancyselectexample.Streets" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'streets.label', default: 'Streets')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-streets" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-streets" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="streets.localborough.label" default="Localborough" /></th>
					
						<g:sortableColumn property="streetName" title="${message(code: 'streets.streetName.label', default: 'Street Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${streetsInstanceList}" status="i" var="streetsInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${streetsInstance.id}">${fieldValue(bean: streetsInstance, field: "localborough")}</g:link></td>
					
						<td>${fieldValue(bean: streetsInstance, field: "streetName")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${streetsInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
