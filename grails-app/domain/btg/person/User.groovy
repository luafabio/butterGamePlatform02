package btg.person

class User {
	
	String fullName
	String email
	String userName
	String password
	String confirmPassword
	int totalScore = 0
	boolean root = false
	boolean status = true
	
	static hasMany = [games: CurrentGame]
	
	static constraints = {
		userName(unique:true, blank:false)
		fullName(blank:false)
		email(unique:true, email:true)
		password(password:true, blank:false, nullable: false, minSize: 8, maxSize: 64)
		totalScore(display:false)
		root(display:false)
		status(display:false)
		games(display:false)
	}

}
