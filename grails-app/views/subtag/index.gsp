
<%@ page import="dms.nexusglobal.Subtag" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'subtag.label', default: 'Subtag')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-subtag" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-subtag" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="subtagName" title="${message(code: 'subtag.subtagName.label', default: 'Subtag Name')}" />
					
						<th><g:message code="subtag.tag.label" default="Tag" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${subtagInstanceList}" status="i" var="subtagInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${subtagInstance.id}">${fieldValue(bean: subtagInstance, field: "subtagName")}</g:link></td>
					
						<td>${fieldValue(bean: subtagInstance, field: "tag")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${subtagInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
