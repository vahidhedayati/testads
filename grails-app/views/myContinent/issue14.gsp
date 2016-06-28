<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'myContinent.label', default: 'MyContinent')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	
		
		
	<body>
	<a href="#create-myContinent" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

	
	


<h1>Example4:  Multi domain dependency call to domain3 and domain4 with domain4 then having its own multi depenency relatiobship</h1><br><br>

Please note only the first computer from each initial department selected has any further values.

<form method=post action=example5>
	
	<ads:selectPrimary id="MyDepartments141" name="MyDepartments141"
        domain='ajaxdependancyselectexample.Departments'
        searchField='name'
        collectField='id'
	noSelection="['': 'Please choose Department']"
        
        domain4='ajaxdependancyselectexample.Employee'
        bindid4="department.id"
        searchField4='name'
        collectField4='id'
        setId4="employeeID141"
      

		domain3='ajaxdependancyselectexample.Documents'
        bindid3="department.id"
        searchField3='name'
        collectField3='id'
        setId3="documentsId141"

	value='1'
        secondaryValue='1'

	value3='1'
	value4='1'
        
        domain2='ajaxdependancyselectexample.Computers'
        bindid="department.id"
        searchField2='pcName'
        collectField2='id'
        setId="computersId141"

        
        
        />

<g:select name="employee" id="employeeID141" optionKey="id" optionValue="name" from="[]" required="required"/>
<g:select name="document" id="documentsId141" optionKey="id" optionValue="name" from="[]" required="required"/>



<ads:selectSecondary id="computersId141" name="computersId141"
	domain2='ajaxdependancyselectexample.Os'
    bindid="computers.id"
    searchField2='osName'
    collectField2='id'
    setId="Os13"
    
    domain3='ajaxdependancyselectexample.Users'
    bindid3="computers.id"
    searchField3='userName'
    collectField3='id'
    setId3="userId13"
	value='1'
        secondaryValue='1'
	value3='6'
    noSelection="['': 'Please choose Department']" 
    
/>


<g:select name="Os" id="Os13" optionKey="id" optionValue="pcName" from="[]" required="required" />
<g:select name="users" id="userId13" optionKey="id" optionValue="userName" from="[]" required="required" />

<input type=submit value=go>  
    </form>



    	</body>
	</html>
