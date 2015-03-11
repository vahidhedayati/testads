package dms.nexusglobal

class Tag {
	String tagName
	static hasMany=[subtag: Subtag]
	static belongsTo=[template:Template]
    static constraints = {
    }
}
