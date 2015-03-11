
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'myContinent.label', default: 'MyContinent')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	
		
		
	<body>


	
	<ads:selectPrimary id="MyCountry1" name="MyCountry1"
        domain='ajaxdependancyselectexample.MyCountry'
        searchField='countryName'
        collectField='id'
        
      

        noSelection="['': 'Please choose Country']" 
        setId="MyCity1"
        showId="MyCityShower"
        value=''

        />
        <div id="MyCityShower" style="display:none;">
        <ads:selectSecondary id="MyCity1" name="Mycity"
          domain='ajaxdependancyselectexample.MyCity'
        bindid="mycountry.id"
        searchField2='cityName'
        collectField2='id'
        noSelection="['': 'Please choose Country']" 
        showId="MyCityShower"
        />
        </div>
<input type=submit value=go>  

    </body>
    </html>