<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			<li><g:link class="list" controller="MyContinent" action="norefselection"><g:message code="no ref" args="[entityName]" /></g:link></li>
			<li><g:link class="list" controller="MyContinent" action="norefselectionext"><g:message code="ext noref" args="[entityName]" /></g:link></li>
			<li><g:link class="list" controller="MyContinent" action="example2"><g:message code="noref autocomp" args="[entityName]" /></g:link></li>
			<li><g:link class="list" controller="MyContinent" action="example"><g:message code="Variety" args="[entityName]" /></g:link></li>
			<li><g:link class="list" controller="MyContinent" action="customexample"><g:message code="custom controller" args="[entityName]" /></g:link></li>
			<li><g:link class="list" controller="MyContinent" action="selectautoComplete"><g:message code="select+AutoComplete" args="[entityName]" /></g:link></li>
			<li><g:link class="list" controller="MyContinent" action="filteringExamples"><g:message code="filtering" args="[entityName]" /></g:link></li>
			<li><g:link class="list" controller="MyContinent" action="noRefAutoComplete"><g:message code="No Ref Auto Complete" args="[entityName]" /></g:link></li>
			<li><g:link class="list" controller="MyContinent" action="selectPrimaryNRExample"><g:message code="selectPrimaryNRExample" args="[entityName]" /></g:link></li>
			<li><g:link class="list" controller="MyContinent" action="selectPrimaryNRFiltering"><g:message code="selectPrimaryNRFiltering" args="[entityName]" /></g:link></li>
			<li><g:link class="list" controller="MyContinent" action="norefselectSecondaryFiltering"><g:message code="norefselectSecondaryFiltering" args="[entityName]" /></g:link></li>
			<li><g:link class="list" controller="MyContinent" action="norefselectSecondaryFilteringFixed"><g:message code="norefselectSecondaryFiltering Fixed Term lookup" args="[entityName]" /></g:link></li>
			<li><g:link class="list" controller="MyContinent" action="multidomainexample"><g:message code="Call multiple domains from one object" args="[entityName]" /></g:link></li>
			
			</ul>
</div>		
<div class="nav" role="navigation">
		<ul>		
			<li><g:link class="list" controller="MyContinent" action="index"><g:message code="MyContinent" args="[entityName]" /></g:link></li>
			<li><g:link class="list" controller="MyCountry" action="index"><g:message code="country" args="[entityName]" /></g:link></li>
			<li><g:link class="list" controller="MyCity" action="index"><g:message code="city" args="[entityName]" /></g:link></li>
			<li><g:link class="list" controller="MyBorough" action="index"><g:message code="Borough" args="[entityName]" /></g:link></li>
			
			<li><g:link class="list" controller="Streets" action="index"><g:message code="streets" args="[entityName]" /></g:link></li>
			<li><g:link class="list" controller="Departments" action="index"><g:message code="depts" args="[entityName]" /></g:link></li>
			<li><g:link class="list" controller="Employee" action="index"><g:message code="employee" args="[entityName]" /></g:link></li>	
		</ul>
</div>
