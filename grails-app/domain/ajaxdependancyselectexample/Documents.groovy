package ajaxdependancyselectexample

class Documents {

   String name
	Departments department
   //static belongsTo=[ department: Departments]
	String toString()  { "${name}"}
}
