package ajaxdependancyselectexample

class MyBorough {
	String actualName
	static belongsTo = [MyCity]
	static hasMany=[streets: Streets]
	String toString() { "${actualName}" }
}
