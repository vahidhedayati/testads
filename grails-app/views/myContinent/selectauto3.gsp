
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'myContinent.label', default: 'MyContinent')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	
		
		
	<body>
	<a href="#create-myContinent" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

  
    <br><br>
    
<h1>Example 1:  Select selectSecondary then auto complete secondary</h1><br><br>
    
 A nested relationship of hasMany and fully dependent relationship with belongsTo in 3<br>    
    

 <form method=post action=example5>
    
    
<ads:selectPrimary id="MyContinent2" name="MyContinent2"
    domain='ajaxdependancyselectexample.MyContinent'
    searchField='continentName'
    collectField='id'
    
    domain2='ajaxdependancyselectexample.MyCountry'
    bindid="mycontinent.id"
    searchField2='countryName'
    appendValue=''
    appendName='Updated'
    collectField2='id'

    hidden="hiddenNew"
    noSelection="['': 'Please choose Continent']" 
    setId="MyCountry11"
    value="${params.MyContinent2}"/>






<ads:selectSecondary id="MyCountry11" name="MyCountry11"
	domain2='ajaxdependancyselectexample.MyCity'
    bindid="mycountry.id"
    searchField2='cityName'
    collectField2='id'
    
    autocomp="1"
     appendValue=''
     appendName='Updated'
    
    
    noSelection="['': 'Please choose Continent']" 
    setId="MyCity11"
    value="${params.MyCountry11}"/>





<label>Cities:</label> 
<ads:autoCompleteSecondary id="MyCity11"
name="myCityId" 
domain='ajaxdependancyselectexample.MyCity'
 primarybind='mycountry.id' 
 hidden='MyCountry11' 
 hidden2='hidden5'
  searchField='cityName' 
 collectField='id' value=''/> 
 <input type=hidden id="hidden5" name="cityId" value=""/>
    <input type=submit value=go>  
    </form>

  <br><br>
  
  
  

	</body>
	</html>
	
