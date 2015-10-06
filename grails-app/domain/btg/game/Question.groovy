package btg.game

class Question {
	
	String question;
	String answer1;
	String answer2;
	String answer3;
	int report = 0 
	int quality = 0
	
	static constraints = {
		question()
		answer1()
		answer2()
		answer3()
		report(display:false)
		quality(display:false)	
	}
}
