package btg.person



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	
	def beforeInterceptor = [action:this.&checkUser,except:['create', 'login', 'index', 'doLogin', 'save']]
	def checkUser() {
		if(!session.user) {
			redirect(controller:'user',action:'login')
			return false
		}
	}
	
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond User.list(params), model:[userInstanceCount: User.count()]
    }

    def show(User userInstance) {
        respond userInstance
    }

    def create() {
        respond new User(params)
    }

    @Transactional
    def save(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'create'
            return
        }		
		
//		if (!userInstance.confirmPassword.equals(userInstance.password)){
//			flash.message = "Las contrasenas ingresadas no coinciden"
//			userInstance.password = ""
//			userInstance.confirmPassword = ""
//			respond userInstance, view:'create'
//			return
//		}
//		
//		userInstance.confirmPassword = ""
		
		userInstance.save flush:true
		
		
        request.withFormat {
            form multipartForm {
                //flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
                redirect(controller:'user',action:'home')
            }
            '*' { respond userInstance, [status: CREATED] }
        }
    }

    def edit(User userInstance) {
        respond userInstance
    }

	def modify = {}
	
	def submitModification(UserModify modifyInstance){
		if (session.user.password.equals(modifyInstance.oldPassword)) {
			if(modifyInstance.newPassword.equals(modifyInstance.confirmPassword)){
				def currentUser = User.findByUserName(session.user.userName)
				currentUser.password = modifyInstance.newPassword
				currentUser.save(flush:true, validate:false)
				logOut()
				
			}
		}
	}
	
    @Transactional
    def update(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'edit'
            return
        }

        userInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*'{ respond userInstance, [status: OK] }
        }
		
    }

    @Transactional
    def delete(User userInstance) {

        if (userInstance == null) {
            notFound()
            return
        }

        userInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
	
	def login() {
		if (session.user) redirect(action:'home')
	}
	
	def doLogin = {
		def user = User.findWhere(email:params['email'],
		password:params['password'])
		session.user = user
		if (user){
			redirect(action:'home')
		}else{
			redirect(action:'login')
		}
	}
	
	def logOut = {
		session.invalidate()
		redirect(action:'login')
	}
	
	def home = { }
	
}
