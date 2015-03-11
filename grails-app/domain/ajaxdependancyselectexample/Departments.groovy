package ajaxdependancyselectexample

class Departments {

	String name
	static hasMany=[employees: Employee, offices: Offices, documents: Documents, computers:Computers]
	String toString()  { "${name}"}
	static constraints = {
	}
}
