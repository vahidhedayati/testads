<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'myContinent.label', default: 'MyContinent')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
	<a href="#create-myContinent" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

<h1>A No Reference mapping within a selection</h1>
In this example we have :<br>

continent -&lt;  hasMany Countries   [ Countries has belongsTo <b>continent:continet</b> ]<br>
countries -&lt;  hasMany Cities [ Cities has belongsTo <b>country:country</b> ]<br>
Cities    -&lt;  hasMany Boroughs - [ Boroughs has belongsTo <b>cities</b> ]<br><br>

<br><b>
Try Europe United Kingdom and London and Camden</b> <br>
  
<br>  
  
	
	<form method=post action=example5>
	
        <ads:selectPrimary id="MyContinent2" name="MyContinent2"
            domain='ajaxdependancyselectexample.MyContinent'
            searchField='continentName'
            collectField='id'

            domain2='ajaxdependancyselectexample.MyCountry'
            bindid="mycontinent.id"
            searchField2='countryName'
            collectField2='id'
            
            appendValue='*'
            appendName='All Items'
            
            noSelection="['': 'Please choose Continent']"
            setId="MyCountry11"
            value=''/>

        <ads:selectSecondary id="MyCountry11" name="MyCountry11"
            domain2='ajaxdependancyselectexample.MyCity'
            bindid="mycountry.id"
            searchField2='cityName'
            collectField2='id'

            noSelection="['': 'Please choose Continent']"
            setId="MyCity11"
            
            appendValue='*'
            appendName='All Items'
            
            value=''/>

        <ads:selectSecondaryNR id="MyCity11" name="MyCity11"
            domain='ajaxdependancyselectexample.MyCity'
            bindid="myborough"
        	searchField='cityName'
            collectField='id'

            domain2='ajaxdependancyselectexample.MyBorough'
            searchField2='actualName'
            collectField2='id'

            noSelection="['': 'Please choose City']"
            setId="MyBorough11"
            
            appendValue='*'
            appendName='All Items'
            
            value=''/>

            <g:select name="MyBorough11" id="MyBorough11" 
            optionKey="id" optionValue="name"
            from="[]" required="required"  noSelection="['': 'Please choose City']" />
        <br> <input type=submit value=go> </form>
        

	</body>
	</html>
	
