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

Add these two tags to g:selectPrimary
<pre>
  		filter='_ON'
        hidden="something"
        filterType="E"   Two declarations = filterEnds With E or StartsWith or default not set = wild card
        filterDisplay="none"		// This set to anything besides all (default value) will ensure nothing is returned with filtering
        								// by default if nothing put in filter box or ticked etc it will display all records, 
        								// enable this option and assign some value to stop it from showing records unless matching search
        
        filterType = Type of filter no definition for wild card S = start of string E ending of string
        so E = Char A =  chinA  S = Char C = Chine  no filterType = Char H = cHina or any other matching chars
        
</pre>


 
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

    


 
  <br><br>


<h1>Example 2: Triple Select conditions</h1><br><br>
    
 A nested relationship of hasMany and fully dependent relationship with belongsTo in 3<br>    
    
 I have added an extra relationship and then enabled filtering of return results on g:selectPrimary and g:selectSecondary<br>
 
 This is basic filtering where the user can define what they wish to filter down to get basic filtering to work these tags are needed:<br><br>
 
 
 
 In a primary situation:<br>
 
 <pre>
    filter='_ON'
    hidden="hiddenNew"
    </pre>
  Simply add the two tags above in<br><br> 
  
  
  To get it working on g:selectSecondary<br><br>
  <pre>
  
  	domain='ajaxdependancyselectexample.MyCity'  //Where this is current domainClass
    searchField='cityName'		//Where this is current SearchField for this domainClass
    collectField='id'			// where this is current return value for this domainClass
    filter='_ON'				//Needed to activate tick box
    filterbind='mycountry.id'	// The actual bindid of this table and your previous selection
    hidden="hidden6"			//This hidden field to set value
    prevId="MyCountry11"		//The previousID of your g:selectPrimary or g:selectSecondary - This must exist for all this to work 
   </pre> 
  
  
  HEre is example:<br>  
    <form method=post action=example5>
    
    
<ads:selectPrimary id="MyContinent22" name="MyContinent22"
    domain='ajaxdependancyselectexample.MyContinent'
    searchField='continentName'
    collectField='id'
    
    domain2='ajaxdependancyselectexample.MyCountry'
    bindid="mycontinent.id"
    searchField2='countryName'
    appendValue=''
    appendName='Updated'
    collectField2='id'
    
    filter='_ON'
    hidden="hiddenNew11"
    noSelection="['': 'Please choose Continent']" 
    setId="MyCountry112"
    value="${params.MyContinent2}"/>






<ads:selectSecondary id="MyCountry112" name="MyCountry112"
	domain2='ajaxdependancyselectexample.MyCity'
    bindid="mycountry.id"
    searchField2='cityName'
    collectField2='id'
    
    
    filter='_ON'
    filterbind='mycontinent.id'
    domain='ajaxdependancyselectexample.MyCountry'
    searchField='countryName'
    collectField='id'
    hidden='hidden511'
    prevId="MyContinent22"
  

    
     appendValue=''
     appendName='Updated'
    
    
    noSelection="['': 'Please choose Continent']" 
    setId="MyCity112"
    value="${params.MyCountry11}"/>





    <ads:selectSecondary name="MyCity112" id="MyCity112"
    optionKey="id" optionValue="name"
    
    
    domain2='ajaxdependancyselectexample.MyShops'
    bindid="mycity.id"
    searchField2='shopName'
    collectField2='id'
    appendValue=''
    appendName='Updated'
   
   
   
 	filter='_ON'
    filterbind='mycountry.id'
    domain='ajaxdependancyselectexample.MyCity'
    searchField='cityName'
    collectField='id'
    hidden="hidden611"
    prevId="MyCountry112"
    
    setId="MyShop1122"
	noSelection="['': 'Please choose Country 1111']" 
	/>



    <g:select name="MyShop1122" id="MyShop1122"  
    optionKey="id" optionValue="name" 
    from="[]" required="required" noSelection="['': 'Please choose City']" 
    />
    

    <input type=submit value=go>  
    </form>

  <br><br>
  




<h1>Example 3 : Multi primary/Secondary with a secondary physically defined value</h1>  

Passing filter Values or PRE - defining a filter value for a selectSecondary<br>

This does start to get a little more confusing, the reason is due to each of these g:select boxes actually processing next select area so to get it to work:

<pre>
filter2="B" -- this will now filter results of next result set to only match B
</pre>

 Was added to the previous g:selectPrimary g:selectSecondary and given the fixed value for the next select box that needs it :
 
  
    <br><br>
    
    So within MyCountry114 filter2="B" was added this will now filter the results returned by B in MyCity114
    
    <br><br>
    
    Please take a look at the last example where all the values are predefined and it filters you down to A [ Asia ] C [China] and B [ Beijing]
    <br><br>
    So by me setting these hard coded values it has ensure the select values match what I Want to show end user - <br><br>
    
<ads:selectPrimary id="MyContinent24" name="MyContinent24"
    domain='ajaxdependancyselectexample.MyContinent'
    searchField='continentName'
    collectField='id'
    
    domain2='ajaxdependancyselectexample.MyCountry'
    bindid="mycontinent.id"
    searchField2='countryName'
    appendValue=''
    appendName='Updated'
    collectField2='id'
    
    filter='_ON'
    hidden="hiddenNew2222"
    filterType="S"
    
    noSelection="['': 'Please choose Continent']" 
    setId="MyCountry114"
    value="${params.MyContinent2}"/>


    



<ads:selectSecondary id="MyCountry114" name="MyCountry114"
	domain2='ajaxdependancyselectexample.MyCity'
    bindid="mycountry.id"
    searchField2='cityName'
    collectField2='id'
    
    
    filter='_ON'
    filterbind='mycontinent.id'
    domain='ajaxdependancyselectexample.MyCountry'
    searchField='countryName'
    collectField='id'
    hidden='hidden52222'
    prevId="MyContinent24"
    filter2="B"

    
     appendValue=''
     appendName='Updated'
    
    
    noSelection="['': 'Please choose Continent']" 
    setId="MyCity114"
    value="${params.MyCountry114}"/>





    <ads:selectSecondary name="MyCity114" id="MyCity114"
       
    domain2='ajaxdependancyselectexample.MyShops'
    bindid="mycity.id"
    searchField2='shopName'
    collectField2='id'
    appendValue=''
    appendName='Updated'
   prevId="MyCountry114"
    
    setId="MyShop124"
	noSelection="['': 'Please choose Country 1111']" 
	/>



    <g:select name="MyShop124" id="MyShop124"  
    optionKey="id" optionValue="name" 
    from="[]" required="required" noSelection="['': 'Please choose City']" 
    />
    

    <input type=submit value=go>  
    
  <br><br>








<h1>Example 4 : Multi primary/Secondary  physically defined value for all</h1>  

It might be a case where we want to filter all results against a db result or something in session or something based on user:

<pre>  
     filter2="B"
   </pre> 
    
    
<ads:selectPrimary id="MyContinent25" name="MyContinent25"
    domain='ajaxdependancyselectexample.MyContinent'
    searchField='continentName'
    collectField='id'
    
    domain2='ajaxdependancyselectexample.MyCountry'
    bindid="mycontinent.id"
    searchField2='countryName'
    appendValue=''
    appendName='Updated'
    collectField2='id'
    
    filter='A'
    hidden="hiddenNew5555"
    filter2="C"
    filterType="S"
    filterType2="S"
    noSelection="['': 'Please choose Continent']" 
    setId="MyCountry115"
    value="${params.MyContinent2}"/>






<ads:selectSecondary id="MyCountry115" name="MyCountry115"
	domain2='ajaxdependancyselectexample.MyCity'
    bindid="mycountry.id"
    searchField2='cityName'
    collectField2='id'
    
    

    filter2="B"
	filterType2="S"
	hidden="hiddenNew55551"
    prevId="MyContinent25"
     appendValue=''
     appendName='Updated'
    
    
    noSelection="['': 'Please choose Continent']" 
    setId="MyCity115"
    value="${params.MyCountry115}"/>





    <ads:selectSecondary name="MyCity115" id="MyCity115"
    
    
    
    domain2='ajaxdependancyselectexample.MyShops'
    bindid="mycity.id"
    searchField2='shopName'
    collectField2='id'
    appendValue=''
    appendName='Updated'
   
    prevId="MyCountry115"
    hidden="hiddenNew55552"
    setId="MyShop125"
	noSelection="['': 'Please choose Country 1111']" 
	/>



    <g:select name="MyShop12" id="MyShop125"  
    optionKey="id" optionValue="shopName" 
    from="[]" required="required" noSelection="['': 'Please choose City']" 
    />
    

    <input type=submit value=go>  
    
  <br><br>



  <br><br>
	</body>
	</html>
	

  <br><br>
	</body>
	</html>
	
