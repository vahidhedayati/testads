<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'myContinent.label', default: 'MyContinent')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	
		
		
	<body>
	<a href="#create-myContinent" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

		
		
		<h1>Select then Auto complete</h1>
This provides a select box which then updates binding to an auto complete box, typically if lets say you have lots of cities and the return be pages and pages for a select box, you could use this function to simply choose country then let user auto complete the city
 <br><br>
 <div>

<form method=post action=example5>
<label>Continent:</label>
<ads:selectAutoComplete
	id="MyContinent2" 
	id2="MyCountry2" 
	name="MyContinent2"
    domain="ajaxdependancyselectexample.MyContinent"
    searchField="continentName"
    collectField="id"
 	primarybind="mycontinent.id"
    domain2="ajaxdependancyselectexample.MyCountry"
    searchField2="countryName"
    collectField2="id"
    
    appendValue=""
    appendName="values updated"
    noSelection="['': 'Please choose Continent']" 
    setId="MyCountry121"
    hidden='hidden3'
    hidden2='hidden4'
    value=""/>
    
    
    

<input type=submit value=go> </form>



<br><br>

	</body>
	</html>
	
