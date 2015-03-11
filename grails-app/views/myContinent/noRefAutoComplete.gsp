

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'myContinent.label', default: 'MyContinent')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
	<a href="#create-myContinent" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

<h1>A No Reference mapping within Auto Complete</h1>
In this example we have :<br>

continent -&lt;  hasMany Countries   [ Countries has belongsTo <b>continent:continet</b> ]<br>
countries -&lt;  hasMany Cities [ Cities has belongsTo <b>country:country</b> ]<br>
Cities    -&lt;  hasMany Boroughs - [ Boroughs has belongsTo <b>cities</b> ]<br><br>

<br><b>
Try Europe United Kingdom and London and Camden</b> <br>
  
<br>  



<form method=post action=example5>

<label>Continent:</label>
	<ads:autoCompletePrimary id="primarySearch1"
	name="NAMEOFcontinentName"
    domain='ajaxdependancyselectexample.MyContinent'
    searchField='continentName'
    collectField='id'
    setId="secondarySearch2"
    hidden='hidden3'
    value=''
    />
	<input type=hidden id="hidden3" name="continentId" value=""/>


	<label>Country:</label> 
	<ads:autoCompleteSecondary
	id="secondarySearch2" 
	name="NAMEOFcountryName" 
	domain='ajaxdependancyselectexample.MyCountry' 
	primarybind='mycontinent.id' 
	hidden='hidden3' 
	hidden2='hidden4' 
	searchField='countryName' 
	collectField='id' 
	setId="secondarySearch3" 
	value=''
	/>
	<input type=hidden id="hidden4" name="countryId" value=""/>


	<label>City:</label> 
	<ads:autoCompleteSecondary
	id="secondarySearch3" 
	name="NAMEOFcityName" 
	domain='ajaxdependancyselectexample.MyCity' 
	primarybind='mycountry.id' 
	hidden='hidden4' 
	hidden2='hidden5' 
	searchField='cityName' 
	collectField='id' 
	setId="secondarySearch4" 
	value=''
	/>
	<input type=hidden id="hidden5" name="cityId" value=""/>


	<label>Borough:</label> 
	<ads:autoCompleteSecondaryNR
	id="secondarySearch4" 
	name="NAMEOFcityName" 
	domain='ajaxdependancyselectexample.MyCity' 
	domain2='ajaxdependancyselectexample.MyBorough' 
	primarybind='myborough' 
	hidden='hidden5' 
	hidden2='hidden6' 
	searchField='actualName' 
	collectField='id'
	value=''
	/>
	<input type=hidden id="hidden6" name="BoroughID" value=""/>

	<input type=submit value=go> 
</form>




