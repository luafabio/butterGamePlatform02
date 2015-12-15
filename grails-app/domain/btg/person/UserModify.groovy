package btg.person

class UserModify {
	
	String oldPassword
	String newPassword
	String confirmPassword
	
	static constraints = {
		oldPassword(blank:false)
		newPassword(blank:false)
		confirmPassword(blank:false)
	}
}
