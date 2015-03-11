package ajaxdependancyselectexample

class MyCountry {
	String countryName
	String ccode
	String language
	MyContinent mycontinent
	static hasMany=[mycity: MyCity]
	
	String toString()  { "${countryName}"}
	
	static optionals = [ 'language' ]
	static mapping = {
		language defaultValue: ''
	}
}
