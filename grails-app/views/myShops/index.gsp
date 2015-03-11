
<%@ page import="ajaxdependancyselectexample.MyShops" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'myShops.label', default: 'MyShops')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-myShops" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-myShops" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="myShops.mycity.label" default="Mycity" /></th>
					
						<g:sortableColumn property="shopName" title="${message(code: 'myShops.shopName.label', default: 'Shop Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${myShopsInstanceList}" status="i" var="myShopsInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${myShopsInstance.id}">${fieldValue(bean: myShopsInstance, field: "mycity")}</g:link></td>
					
						<td>${fieldValue(bean: myShopsInstance, field: "shopName")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${myShopsInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
