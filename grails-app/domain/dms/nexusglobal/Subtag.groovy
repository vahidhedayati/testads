package dms.nexusglobal

class Subtag {
	String subtagName
	static belongsTo=[tag:Tag]
    static constraints = {
    }
}
