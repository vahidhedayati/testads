package ajaxdependancyselectexample

class MyContinent {
	String continentName
	static hasMany=[mycountry: MyCountry]
	String toString()  { "${continentName}"}
}
