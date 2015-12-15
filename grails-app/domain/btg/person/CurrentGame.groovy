package btg.person

class CurrentGame {
	
	static transients = ["numQuestion"]
	
	int numQuestion
	int score
	boolean result
	Date fecha
	
	static belongsTo = [user: User]

	static constraints = {
		numQuestion(bindable:true)

	}
}
