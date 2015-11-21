package btg.game

import java.util.List;

import btg.person.CurrentGame;
import btg.person.User;
import btg.game.CurrentQuestion;
import btg.game.Question;

class DisplayQuestionController {
	
	public static CurrentGame currentGame1 = new CurrentGame()
	public static CurrentQuestion currentQuestion1 = new CurrentQuestion()
	public static List<Question> allQuestion
	
	def beforeInterceptor = [action:this.&checkUser]
	def checkUser() {
		if(!session.user) {
			redirect(controller:'user',action:'login')
			return false
		}
	}
	
	def index() { 
		setDB()
		renderQuestion(getQuestion())
	}
	
	def setDB(){
		
		currentGame1.numQuestion = 0
		currentGame1.score = 0
		allQuestion = Question.findAll()
		Collections.shuffle(allQuestion)
		

	}

	def nextQuestion(){
		renderQuestion(getQuestion())
	}
	
	def getQuestion(){
		currentGame1.numQuestion++
		if (currentGame1.numQuestion == 6){
			finalScore()
//			render("Termino el juego    "+currentGame1.score)
//			if (currentGame1.score > 5) render ("    has ganado")
			redirect(action: 'termino')
		}
		else
			return randomizeQuestion(allQuestion.get(currentGame1.numQuestion))	
	}
	
	def termino() {
		
		[gameInstance: currentGame1]
	}
	
	def denuncia(){
		
		def actualPregunta = Question.findById(currentQuestion1.id)
		actualPregunta.report = actualPregunta.report + 1
		actualPregunta.save flush:true
		
		nextQuestion()
	}
	
	def renderQuestion(questionAux){
		render( view: "nextQuestion", model: [questionInstance: questionAux, gameInstance: currentGame1]) 		//renderiza una pregunta
		
	}
	
	def isCorrectAnswer(currentAnswer){ 
		if (currentAnswer == currentQuestion1.correctAns){
			addScore(true)
			currentQuestion1.statusQues = "true"
		} 
		else {
			addScore(false)
			currentQuestion1.statusQues = "false"
		}
			
		render( view: "resultQuestion", model: [currentInstance: currentQuestion1, gameInstance: currentGame1])	//renderiza el resultado de la pregunta
		
	}
	
	def isTimeOut(){
		
		currentQuestion1.statusQues = "false"
		render( view: "resultQuestion", model: [currentInstance: currentQuestion1, gameInstance: currentGame1])
	}
	
	def isCorrectAnswerA(){
		isCorrectAnswer(currentQuestion1.answer1)
		
	}
	
	def isCorrectAnswerB(){
		isCorrectAnswer(currentQuestion1.answer2)
		
	}
	
	def isCorrectAnswerC(){
		isCorrectAnswer(currentQuestion1.answer3)
	
	}
	
	def randomizeQuestion(question){
		
		currentQuestion1.id = question.id
		currentQuestion1.question = question.question				//Set current question
		currentQuestion1.correctAns = question.answer1				//Set correct answer
		
		List<Integer> listQuestion = new LinkedList()
		listQuestion.add(question.answer1)
		listQuestion.add(question.answer2)
		listQuestion.add(question.answer3)
		
		Collections.shuffle(listQuestion)
		
		currentQuestion1.answer1 = listQuestion.get(0)
		currentQuestion1.answer2 = listQuestion.get(1)
		currentQuestion1.answer3 = listQuestion.get(2)
		
		return currentQuestion1
		
	}
	
	def addScore(result){
		if (result) currentGame1.score++	
	}
	
	def finalScore(){
		if (currentGame1.score >= 3){
			currentGame1.score = currentGame1.score +5
			currentGame1.result = true
		}
		
		
		//ASIGNO PUNTAJE TOTAL
		def currentUser1 = User.findByUserName(session.user.userName)
		currentUser1.totalScore = currentUser1.totalScore + currentGame1.score
		currentUser1.save(flush:true, validate:false)
		
		//ASIGNO FECHA AL GAME
		java.util.Date fechaAux = new Date();
		currentGame1.fecha = fechaAux
		
		
		//GUARDO EL JUEGO CON PUNTERO EN EL USUARIO
		currentGame1.user = session.user
		currentGame1.save(flush:true, insert:true)
		
		
		
	}
}