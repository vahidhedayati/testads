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
        domain='redeanimalg3.Estado'
        searchField='nome'
        collectField='id'

        domain2='redeanimalg3.Cidade'
        bindid="estado.id"
        searchField2='nome'
        collectField2='id'

        noSelection="['': 'Please choose Country']"
	setId='MyCity1'
        />

<g:select name="MyCity1" id="MyCity1" optionKey="id" optionValue="nome" from="[]" required="required" noSelection="['': 'Please choose Country']" />
<input type=submit value=go>
    </form>

</body>
</html>
