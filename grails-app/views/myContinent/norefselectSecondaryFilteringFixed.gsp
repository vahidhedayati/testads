<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'myContinent.label', default: 'MyContinent')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
	
<h1>Nested Selection from fully fixed search on secondaryNR -</h1>
Now fixed, In this example we have locked down:

<pre>

 Primary Option : Continent :  filter=E  - Select Area now  only displays Europe in the select Option
	selectPrimary  Continent has:
	
		filter="E"
		filter2="U" 
	
 Secondary Option 1 : Primary has passed on U as a filter to it so Countries will only show up United Kingdom 	
	selectSecondary Country has:
	filter2="L"
	
	
 SecondaryNR Option 2 : Secondary Option1 has passed on L as a filter to it so Cities  will only show up London
 It is a NR because it is next calling a no reference domainClass of myBorough
	selectSecondaryNR City has:
	filter2="C"
	
Secondary Option 3 : SecondaryNR Option2 has passed on C as a filter to it so Boroughs will only show up Camden
	selectSecondary Borough has:
	filter2="V"
		
Final standard Select box &lt;g:select shows up Vauxhall Road, last secondary call passed this filter down	
	
</pre>
	
	
    <form method=post action=example5>
<ads:selectPrimary id="MyContinent2" name="MyContinent2"
    domain='ajaxdependancyselectexample.MyContinent'
    searchField='continentName'
    collectField='id'
   
    domain2='ajaxdependancyselectexample.MyCountry'
    bindid="mycontinent.id"
    searchField2='countryName'
    filter="E"
    filter2="U"
    collectField2='id'
    noSelection="['': 'Please choose Continent']"
    setId="MyCountry11"
    value=''/>

<ads:selectSecondary id="MyCountry11" name="MyCountry11"
    domain2='ajaxdependancyselectexample.MyCity'
    bindid="mycountry.id"
    searchField2='cityName'
    collectField2='id'

	filter2="L"

    
    noSelection="['': 'Please choose Continent']"
    setId="MyCity11"
    value=''/>

<ads:selectSecondaryNR id="MyCity11" name="MyCity11"
	domain='ajaxdependancyselectexample.MyCity'
    bindid="myborough"
	searchField='cityName'
    collectField='id'
    
    	filter2="C"
   	
    domain2='ajaxdependancyselectexample.MyBorough'
     searchField2='actualName'
    collectField2='id'
     
    noSelection="['': 'Please choose City']"
    setId="MyBorough11"
    value=''/>


<br>
<ads:selectSecondary id="MyBorough11" name="MyBorough11"
    domain2='ajaxdependancyselectexample.Streets'
    bindid="localborough.id"
    searchField2='streetName'
    collectField2='id'
   
   	filter2="V"
    noSelection="['': 'Please choose Borough']"
    setId="MyRoad22"
    value=''/>
    
     <g:select name="MyRoad22" id="MyRoad22"  
    optionKey="id" optionValue="name" 
    from="[]" required="required" noSelection="['': 'Please choose Borough']" />
    
    
    
   
<br> <input type=submit value=go> </form>

<br><br>

	</body>
	</html>
	
