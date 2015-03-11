
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
    
    <ads:selectPrimary id="template" name="template"
domain='dms.nexusglobal.Template'
searchField='templateName'
collectField='id'

domain2='dms.nexusglobal.Tag'
bindid="template.id"
searchField2='tagName'
collectField2='id'

hidden="hiddenNew"
noSelection="['': 'Please choose Template']" 
setId="tag"
value="${documentPartInstance?.template}"/>

<g:selectSecondary id="tag" name="tag"
domain2='dms.nexusglobal.Subtag'
bindid="tag.id"
searchField2='subtagName'
collectField2='id'

autocomp="1"

noSelection="['': 'Please choose Tag']" 
setId="subtag"
value="${documentPartInstance?.tag}"/>


<ads:autoCompleteSecondary id="subtag" name="subtagId"

domain='dms.nexusglobal.Subtag'
primarybind='tag.id'
hidden='tag'
hidden2='hidden5'
searchField='subtagName'
collectField='id'

value='${documentPartInstance?.subtag}'/>

 <input type=hidden id="hidden5" name="subtagId" value="${documentPartInstance?.subtag}"/>


    <input type=submit value=go>  
    </form>

  <br><br>
  
  
  

	</body>
	</html>
	
