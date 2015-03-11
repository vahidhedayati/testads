package ajaxdependancyselectexample

class Table2 {
	String bName
	static belongsTo=[tablea: Table1]
    static constraints = {
    }
}
