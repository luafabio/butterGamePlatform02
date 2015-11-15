package btg.person

class CurrentGame {
	
	int numQuestion
	int score
	boolean result
	Date fecha
	
	static belongsTo = [user: User]

}
