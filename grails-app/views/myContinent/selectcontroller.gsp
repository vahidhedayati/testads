
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'myContinent.label', default: 'MyContinent')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>


<h1>Example 7: Controller actions</h1>
This is an example of interacting with my contollers and their actions using this plugin<br><Br>

<g:form method="post" action="example5">

<div class="fieldcontain ${hasErrors(bean: permissionsInstance, field: 'controllerName', 'error')} ">
	<label for="controllerName">
		<g:message code="permissions.controllerName.label" default="Controller Name" />
	</label>
	<ads:selectController id="controllerName" name="controllerName"
	searchField='name'
	collectField='name'
	noSelection="['*': 'All Controllers']"
	setId="ControllerActions"
	value="${permissionsInstance?.controllerName}"/>
</div>




<div class="fieldcontain ${hasErrors(bean: permissionsInstance, field: 'controllerAction', 'error')} ">
	<label for="controllerAction">
		<g:message code="permissions.controllerAction.label" default="Controller Action" />
	</label>
	<g:select name="controllerAction" id="ControllerActions"
	optionKey="name" optionValue="name"  value="${permissionsInstance?.controllerAction}"
	from="[]" noSelection="['*': 'All Controller Actions']" />
</div>
<br> <input type=submit value=go>

</g:form>

	</body>
	</html>
