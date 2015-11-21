package btg.stats


import btg.person.CurrentGame;
import btg.person.User;
import btg.game.CurrentQuestion;
import btg.game.Question;

class StatsController {
	
	static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	
    def index() {
		
		def games = CurrentGame.findAllWhere(user: session.user)
		def topScores = User.listOrderByTotalScore(max: 10, order: "desc")
		def currentUser1 = User.findByUserName(session.user.userName)
		def cntGames = games.size()
		def tScore = currentUser1.totalScore
		def pEfic = (tScore == 0) ? 0: (tScore/cntGames)
		[profileInstance: currentUser1, cantidadInstance: cntGames, eficienciaInstance: pEfic, currentGameInstanceList1: games, currentGameInstanceList2:topScores]
	}
}
