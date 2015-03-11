<%@ page import="ajaxdependancyselectexample.MyShops" %>



<div class="fieldcontain ${hasErrors(bean: myShopsInstance, field: 'mycity', 'error')} required">
	<label for="mycity">
		<g:message code="myShops.mycity.label" default="Mycity" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="mycity" name="mycity.id" from="${ajaxdependancyselectexample.MyCity.list()}" optionKey="id" required="" value="${myShopsInstance?.mycity?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: myShopsInstance, field: 'shopName', 'error')} ">
	<label for="shopName">
		<g:message code="myShops.shopName.label" default="Shop Name" />
		
	</label>
	<g:textField name="shopName" value="${myShopsInstance?.shopName}"/>
</div>

