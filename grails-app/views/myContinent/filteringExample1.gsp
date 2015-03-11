

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'myContinent.label', default: 'MyContinent')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	
		
		
	<body>
	<a href="#create-myContinent" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

	
	
<h1>Example1: Basic Filtering in g:selectPrimary </h1><br><br>
A simple two tier relationship requires a call to selectPrimary with result returned to [] of MyCity1 normal select box<br><br>


 
<form method=post action=example5>
	
	<ads:selectPrimary id="MyCountry11" name="MyCountry11"
        domain='ajaxdependancyselectexample.MyCountry'
        searchField='countryName'
        collectField='id'
        
        domain2='ajaxdependancyselectexample.MyCity'
        bindid="mycountry.id"
        searchField2='cityName'
        collectField2='id'
        filter='_ON'
        filterType="S"
        filterDisplay="none"
        hidden="something"
        noSelection="['': 'Please choose Country']" 
        setId="MyCity11"
        value=''/>

<g:select name="MyCity11" id="MyCity11" optionKey="id" optionValue="cityName" from="[]" required="required" noSelection="['': 'Please choose Country']" />
<input type=submit value=go>  
    </form>




 
<form method=post action=example5>
	
	<ads:selectPrimary id="MyCountry11" name="MyCountry112"
        domain='ajaxdependancyselectexample.MyCountry'
        searchField='countryName'
        collectField='id'
        
        domain2='ajaxdependancyselectexample.MyCity'
        bindid="mycountry.id"
        searchField2='cityName'
        collectField2='id'


        noSelection="['': 'Please choose Country']" 
        setId="MyCity112"
        value=''/>

<g:select name="MyCity112" id="MyCity11" optionKey="id" optionValue="cityName" from="[]" required="required" noSelection="['': 'Please choose Country']" />
<input type=submit value=go>  
    </form>

  <br><br>
	</body>
	</html>
	
