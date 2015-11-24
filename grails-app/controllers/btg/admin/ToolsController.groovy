package btg.admin

import btg.game.Question;

class ToolsController {

    def index() { }
	
	def reportTable() {
		def val = 'true'
		def questionList = Question.listOrderByReport(max: 10, order: "desc")
		render( view: "questionList", model: [questionInstanceList: questionList, valInstance: val])
	}
	
	def valueTable() {
		def val = 'false'
		
		def questionListAux = Question.where { quality != 0 }
		def questionList = questionListAux.list(sort:"quality", max: 10, order: "desc")
		render( view: "questionList", model: [questionInstanceList: questionList, valInstance: val])
	}
}
