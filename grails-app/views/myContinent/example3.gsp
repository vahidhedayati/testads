<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'myContinent.label', default: 'MyContinent')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	
		
		
	<body>


	<ads:selectPrimary id="Test1" name="Test1"
        domain='ajaxdependancyselectexample.Table1'
        searchField='aName'
        collectField='id'

        domain2='ajaxdependancyselectexample.Table2'
        bindid="tablea.id"
        searchField2='bName'
        collectField2='id'

        noSelection="['': 'Please choose test1']"
        setId="Test2ID"
        value=''/>

<g:select name="test2" id="Test2ID" optionKey="id" optionValue="bName" from="[]" required="required" noSelection="['': 'Please choose test1']" />
<input type=submit value=go>

	</body>
	</html>
	
