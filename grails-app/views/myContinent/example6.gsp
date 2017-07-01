 

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'myContinent.label', default: 'MyContinent')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	
		
		
	<body>
	<a href="#create-myContinent" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
 
 
 <form method=post action=example5>
<g:selectPrimary id="MyContinent2" name="MyContinent2"

    domain='duff'
	searchField='continentName'
    collectField='id'
   	primaryList="${primaryList }"
    domain2='ajaxdependancyselectexample.MyCountry'
    bindid="mycontinent.id"
    searchField2='countryName'
    collectField2='id'
    noSelection="['': 'Please choose Continent']"
    setId="MyCountry11"
    value=''/>

<g:selectSecondary id="MyCountry11" name="MyCountry11"
    domain2='ajaxdependancyselectexample.MyCity'
    bindid="mycountry.id"
    searchField2='cityName'
    collectField2='id'

    noSelection="['': 'Please choose Continent']"
    setId="MyCity11"
    value=''/>

<g:selectSecondaryNR id="MyCity11" name="MyCity11"
	domain='ajaxdependancyselectexample.MyCity'
    bindid="myborough"
	searchField='cityName'
    collectField='id'
    
    domain2='ajaxdependancyselectexample.MyBorough'
     searchField2='actualName'
    collectField2='id'
     
    noSelection="['': 'Please choose City']"
    setId="MyBorough11"
    value=''/>


<br>
<g:selectSecondary id="MyBorough11" name="MyBorough11"
    domain2='ajaxdependancyselectexample.Streets'
    bindid="localborough.id"
    searchField2='streetName'
    collectField2='id'
   
    noSelection="['': 'Please choose Borough']"
    setId="MyRoad22"
    value=''/>
    
     <g:select name="MyRoad22" id="MyRoad22"  
    optionKey="id" optionValue="name" 
    from="[]" required="required" noSelection="['': 'Please choose Borough']" />
    
    
    
   
<br> <input type=submit value=go> </form>

</body>
</html>