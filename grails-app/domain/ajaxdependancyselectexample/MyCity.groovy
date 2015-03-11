package ajaxdependancyselectexample

class MyCity {

	String cityName
	MyCountry mycountry
	static hasMany=[myborough: MyBorough, shops:MyShops]
	String toString()  { "${cityName}"}
}
