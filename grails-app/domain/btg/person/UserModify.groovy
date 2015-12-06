package btg.person

class UserModify {
	
	String oldPassword
	String newPassword
	String confirmPassword
	
	static constraints = {
		oldPassword()
		newPassword()
		confirmPassword()
	}
}
