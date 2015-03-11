package ajaxdependancyselectexample

class Computers {
	Departments department
	String pcName
	static hasMany=[os: Os, users: Users]
    static constraints = {
    }
}
