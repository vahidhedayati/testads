<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'myContinent.label', default: 'MyContinent')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
<style>
.bigFont{
	font-weight: bold;
	font-size: 1.9em;
}
</style>
	</head>
	
		
		
	<body>

	
	
<h1>Example1: Dual select condition</h1><br><br>
A simple two tier relationship requires a call to selectPrimary with result returned to [] of MyCity1 normal select box<br><br>


<form method=post action=example5>
	
	<ads:selectPrimary class="bigFont" id="MyCountry1" name="MyCountry1"
        domain='ajaxdependancyselectexample.MyCountry'
        searchField='countryName'
        collectField='id'
        
        domain2='ajaxdependancyselectexample.MyCity'
        bindid="mycountry.id"
        searchField2='cityName'
        collectField2='id'

        noSelection="['': 'Please choose Country']" 
        setId="MyCity1"
        value='1'
        secondaryValue='2'
        />

<g:select name="MyCity1" id="MyCity1" optionKey="id" optionValue="cityName" from="[]" required="required" noSelection="['': 'Please choose Country']" />
<input type=submit value=go>  
    </form>

    
    
  <br><br>

    <br><br>
    
<h1>Example 2: Triple Select conditions</h1><br><br>
    
 A nested relationship of hasMany and fully dependent relationship with belongsTo in 3<br>    
    

 <form method=post action=example5>
    
    
<ads:selectPrimary id="MyContinent2" class="bigFont" name="MyContinent2"
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






<ads:selectSecondary id="MyCountry11" class="bigFont"  name="MyCountry11"
	domain2='ajaxdependancyselectexample.MyCity'
    bindid="mycountry.id"
    searchField2='cityName'
    collectField2='id'
    
    
     appendValue=''
     appendName='Updated'
    
    
    noSelection="['': 'Please choose Continent']" 
    setId="MyCity11"
    value="${params.MyCountry11}"/>





<ads:selectSecondary name="MyCity11" id="MyCity11"
    optionKey="id" optionValue="name"
    
    
    domain2='ajaxdependancyselectexample.MyShops'
    bindid="mycity.id"
    searchField2='shopName'
    collectField2='id'
    appendValue=''
    appendName='Updated'
   
    
    setId="MyShop12"
	noSelection="['': 'Please choose Country 1111']" 
	/>



    <g:select name="MyShop12" id="MyShop12"  
    optionKey="id" optionValue="shopName" 
    from="[]" required="required" noSelection="['': 'Please choose City']" 
    />
    

    <input type=submit value=go>  
    </form>

  <br><br>
  
  

    
    

  <br><br>
<h1>Example 3: Triple auto complete</h1>

Same as above but this time in auto complete mode:<br>

<form method=post action=example5>
<label>Continent:</label>
<ads:autoCompletePrimary id="primarySearch15"
name="NAMEOFcontinentName"
domain='ajaxdependancyselectexample.MyContinent'
searchField='continentName'
collectField='id'
setId="secondarySearch25"
hidden='hidden223'
value=''/>

<input type=hidden id="hidden223" name="continentId" value=""/>

<label>Country:</label>
<ads:autoCompleteSecondary id="secondarySearch25"
name="NAMEOFcountryName" 
domain='ajaxdependancyselectexample.MyCountry' 
primarybind='mycontinent.id' 
hidden='hidden223'
hidden2='hidden214'
searchField='countryName' 
collectField='id'
setId="secondarySearch35"
value=''/>

<input type=hidden id="hidden214" name="countryId" value=""/>

<label>City:</label>
<ads:autoCompleteSecondary id="secondarySearch35"
name="NAMEOFcityName" 
domain='ajaxdependancyselectexample.MyCity' 
primarybind='mycountry.id' 
hidden='hidden214'
hidden2='hidden5525'
searchField='cityName' 
collectField='id' 
value=''/>

<input type=hidden id="hidden5525" name="cityId" value=""/>

<input type=submit value=go> </form>
<br><br>

<h1> Example 4: dual auto complete twice</h1>

Ok so we are doing two different components of a form and calling the autComplete twice on one page, the thing with this example is rather daft since all of the above are also on this page haha

<br><br><br>
 <form method=post action=exampel5>
 
 <label>Countries:</label>
<ads:autoCompletePrimary id="primarySearch1121" name="myCountryId"
     domain='ajaxdependancyselectexample.MyCountry'
     searchField='countryName'
     collectField='id'
     hidden='hidden2'
     setId="secondarySearch111"
     value=''/>
<input type=hidden id="hidden2" name="hiddenField" value=""/>

<label>Cities:</label> 
<ads:autoCompleteSecondary id="secondarySearch111"
name="myCityId" 
domain='ajaxdependancyselectexample.MyCity'
 primarybind='mycountry.id' 
 hidden='hidden2' 
 hidden2='hidden5'
  searchField='cityName' 
 collectField='id' value=''/> 
 <input type=hidden id="hidden5" name="cityId" value=""/>

<br><br>
<label>Department:</label>

<ads:autoCompletePrimary id="primarySearch112"
name="deparmentName" 
domain='ajaxdependancyselectexample.Departments' 
searchField='name' 
collectField='id' 
setId="secondarySearch22" 
hidden='hidden44' 
value=''/>
 <input type=hidden id="hidden44" name="departmentId" value=""/>

<label>Cities:</label> 
<ads:autoCompleteSecondary id="secondarySearch22"
name="employeeName" 
domain='ajaxdependancyselectexample.Employee' 
primarybind='department.id' 
hidden='hidden44' 
hidden2='hidden55' 
searchField='name' 
collectField='id' value=''/> 
<input type=hidden id="hidden55" name="employeeId" value=""/> <br/><br/>

<input type=submit value=go> </form>


<br><br>



<br><br>
<h1>Example 5 : single Auto complete</h1>
Very basic one form field auto complete<br><br>

<form method=post action=example5>
<label>Countries:</label>
<ads:autocomplete id="primarySearch" name="myId"
domain='ajaxdependancyselectexample.MyCountry'
searchField='countryName'
collectField='id'
value=''/>
<input type=submit value=go> </form>

<br><br>

<br><br>
<h1>Example 6: single Auto complete showCollection</h1>
Single Auto complete where optionValue and Name are the same:<br><br>
<form method=post action=example5>
<label>Countries:</label>

<ads:autocomplete id="primarySearch2" name="myId2"
action='autocompleteShowCollect'
domain='ajaxdependancyselectexample.MyCountry'
searchField='countryName'
collectField='id'
value=''/>

<input type=submit value=go> </form>


<br><br>


<h1>Example 7: Controller actions</h1>
This is an example of interacting with my contollers and their actions using this plugin<br><Br>

<form method=post action=example5>

<div class="fieldcontain ${hasErrors(bean: permissionsInstance, field: 'controllerName', 'error')} ">
	<label for="controllerName">
		<g:message code="permissions.controllerName.label" default="Controller Name" />		
	</label>
	<ads:selectController id="controllerName" name="controllerName"
	searchField='name'
	collectField='name'
	noSelection="['*': 'All Controllers']" 
	setId="ControllerActions"
	value="${permissionsInstance?.controllerName}"/>
</div>




<div class="fieldcontain ${hasErrors(bean: permissionsInstance, field: 'controllerAction', 'error')} ">
	<label for="controllerAction">
		<g:message code="permissions.controllerAction.label" default="Controller Action" />
	</label>
	<g:select name="controllerAction" id="ControllerActions" 
	optionKey="name" optionValue="name"  value="${permissionsInstance?.controllerAction}"
	from="[]" noSelection="['*': 'All Controller Actions']" /> 
</div> 
<br> <input type=submit value=go> 

</form>


<br><br>


	</body>
	</html>
	
