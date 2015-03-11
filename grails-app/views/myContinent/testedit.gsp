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
	
	<ads:selectPrimary id="MyCountry1" name="MyCountry1"
        domain='ajaxdependancyselectexample.MyCountry'
        searchField='countryName'
        collectField='id'
        domain2='ajaxdependancyselectexample.MyCity'
        bindid="mycountry.id"
        searchField2='cityName'
        collectField2='id'
        noSelection="['': 'Please choose Country']" 
        setId="MyCity1"
        value='4'
        secondaryValue='10'
        />
<g:select name="MyCity1" id="MyCity1" optionKey="id" optionValue="cityName" from="[]" required="required" noSelection="['': 'Please choose Country']" />
<input type=submit value=go>  
</form>



 <form method=post action=example5>
<ads:selectPrimary id="MyContinent2" name="MyContinent2"
    domain='ajaxdependancyselectexample.MyContinent'
    searchField='continentName'
    collectField='id'
    
    domain2='ajaxdependancyselectexample.MyCountry'
    bindid="mycontinent.id"
    searchField2='countryName'
    collectField2='id'
    hidden="hiddenNew"
    noSelection="['': 'Please choose Continent']" 
    setId="MyCountry11"
    value='2'
    secondaryValue='2'
    />

<ads:selectSecondary id="MyCountry11" name="MyCountry11"
	domain2='ajaxdependancyselectexample.MyCity'
    bindid="mycountry.id"
    searchField2='cityName'
    collectField2='id'
    noSelection="['': 'Please choose Continent']" 
    setId="MyCity11"
    value="2"
 	secondaryValue='6'
/>

<ads:selectSecondary name="MyCity11" id="MyCity11"
    optionKey="id" optionValue="name"
    domain2='ajaxdependancyselectexample.MyShops'
    bindid="mycity.id"
    searchField2='shopName'
    collectField2='id'
    setId="MyShop12"
	noSelection="['': 'Please choose Country 1111']" 
	value='6'
	 secondaryValue='10'
/>



    <g:select name="MyShop12" id="MyShop12"  
    optionKey="id" optionValue="shopName" 
    from="[]" required="required" noSelection="['': 'Please choose City']" 
    
    />
    

    <input type=submit value=go>  
    </form>
    
    </body>
    </html>