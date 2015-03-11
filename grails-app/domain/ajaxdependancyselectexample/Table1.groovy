package ajaxdependancyselectexample

class Table1 {

	String aName
	static hasMany=[tableb: Table2]
    static constraints = {
    }
}
