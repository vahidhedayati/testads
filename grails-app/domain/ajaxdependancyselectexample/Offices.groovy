package ajaxdependancyselectexample

class Offices {
	String name
	static belongsTo = [ Departments]
	String toString()  { "${name}"}
    static constraints = {
    }
}
