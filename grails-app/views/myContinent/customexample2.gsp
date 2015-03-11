<%@ page import="ajaxdependancyselectexample.MyContinent" %>
<%@ page import="ajaxdependancyselectexample.MyCountry" %>
<%@ page import="ajaxdependancyselectexample.MyCity" %>


<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'myContinent.label', default: 'MyContinent')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	
		
		
	<body>
	<a href="#create-myContinent" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

		
<h1>Custom Controller and Action method</h1>
By adding your own controller and action, you can take it away and produce your own JSON - you will notice not as much input is then required, using a selectPrimary with no bindings or secondary domaiuns etc

<br><br>Choose Europe and France will be the only choice since according to:<br>
 
controller="MyContinent"<br>
action="selectCountries"<br>

It will only list Countries starting with F

    

    
    
 <br><br>


<form method=post action=example5>
<label>Continent:</label>
<g:selectPrimary id="MyContinent2" name="MyContinent2"
    domain="ajaxdependancyselectexample.MyContinent"
    searchField="continentName"
    collectField="id"

    
    controller="MyContinent"
    action="listCountry"
    
     domain2="micky.mouse.FakeDomain"
     searchField2="fakeSearch"
    collectField2="fakeCollect"
    
    noSelection="['': 'Please choose Continent']" 
    setId="MyCountry121"
    value=""/>
    
 <g:select name="MyCountry" id="MyCountry121"  from="[]" required="required" noSelection="['': 'Please choose Continent']" />

<input type=submit value=go> </form>



<br><br>


<pre>


&lt;form method=post action=example5&gt;
&lt;label&gt;Continent:&lt;/label&gt;
&lt;g:selectPrimary id="MyContinent2" name="MyContinent2"
    domain="ajaxdependancyselectexample.MyContinent"
    searchField="continentName"
    collectField="id"

    controller="MyContinent"
    action="selectCountries"
    noSelection="['': 'Please choose Continent']" 
    setId="MyCountry121"
    value=""/&gt;
    
 &lt;g:select name="MyCountry" id="MyCountry121"  from="[]" required="required" noSelection="['': 'Please choose Continent']" /&gt;

&lt;input type=submit value=go&gt; &lt;/form&gt;

</pre>
	</body>
	</html>
	
