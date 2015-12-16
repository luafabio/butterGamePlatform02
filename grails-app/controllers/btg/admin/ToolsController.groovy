package btg.admin

import btg.game.Question;

class ToolsController {

    def index() { }
	
	def reportTable() {
		def val = 'true'
		def questionListAux = Question.where { report != 0 }
		def questionList = questionListAux.list(sort:"report", max: 10, order: "desc")
		
		
		render( view: "questionList", model: [questionInstanceList: questionList, valInstance: val])
	}
	
	def valueTable() {
//		def val = 'false'
//		
//		def questionList = Question.listOrderByQuality(order: "desc")
//		render( view: "questionList", model: [questionInstanceList: questionList, valInstance: val])
		redirect(controller:'question',action:'index')
	}
}
