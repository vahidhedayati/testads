<%@ page import="ajaxdependancyselectexample.MyCity" %>



<div class="fieldcontain ${hasErrors(bean: myCityInstance, field: 'cityName', 'error')} ">
	<label for="cityName">
		<g:message code="myCity.cityName.label" default="City Name" />
		
	</label>
	<g:textField name="cityName" value="${myCityInstance?.cityName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: myCityInstance, field: 'myborough', 'error')} ">
	<label for="myborough">
		<g:message code="myCity.myborough.label" default="Myborough" />
		
	</label>
	<g:select name="myborough" from="${ajaxdependancyselectexample.MyBorough.list()}" multiple="multiple" optionKey="id" size="5" value="${myCityInstance?.myborough*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: myCityInstance, field: 'mycountry', 'error')} required">
	<label for="mycountry">
		<g:message code="myCity.mycountry.label" default="Mycountry" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="mycountry" name="mycountry.id" from="${ajaxdependancyselectexample.MyCountry.list()}" optionKey="id" required="" value="${myCityInstance?.mycountry?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: myCityInstance, field: 'shops', 'error')} ">
	<label for="shops">
		<g:message code="myCity.shops.label" default="Shops" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${myCityInstance?.shops?}" var="s">
    <li><g:link controller="myShops" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="myShops" action="create" params="['myCity.id': myCityInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'myShops.label', default: 'MyShops')])}</g:link>
</li>
</ul>

</div>

