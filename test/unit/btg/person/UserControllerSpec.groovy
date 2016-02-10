package btg.person



import grails.test.mixin.*
import spock.lang.*

@TestFor(UserController)
@Mock(User)
class UserControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        params["name"] = 'someValidName'
    }

    void "Prueba: la accion 'index' retorna el modelo correcto"() {

        when:"La accion index es ejecutada"
            controller.index()

        then:"El modelo es el correcto"
            !model.userInstanceList
            model.userInstanceCount == 0
    }

    void "Prueba: la accion 'crear' retorna el modelo correcto"() {
        when:"La accion create es ejecutada"
            controller.create()

        then:"El modelo se creo correctamente"
            model.userInstance!= null
    }

    void "Prueba: la accion 'guardar' persiste correctamente"() {

        when:"La accion guardar es ejecutada con una instancia invalida"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def user = new User()
            user.validate()
            controller.save(user)

        then:"La vista de creacion se renderiza nuevamente con el modelo correcto"
            model.userInstance!= null
            view == 'create'

        when:"La opcion guardar es ejecutada con una instancia valida"
            response.reset()
            populateValidParams(params)
            user = new User(params)

            controller.save(user)

        then:"Se redirecciona a la accion home"
            response.redirectedUrl == '/'
            controller.flash.message != null
    }

    void "Prueba: La accion 'mostrar' retorna el modelo correcto"() {
        when:"La accion mostrar es ejecutada con argumento null"
            controller.show(null)

        then:"Retorna error 404"
            response.status == 404

        when:"La accion mostrar es ejecutada con un argumento"
            populateValidParams(params)
            def user = new User(params)
            controller.show(user)

        then:"Un modelo es cargado conteniendo la instancia del argumento"
            model.userInstance == user
    }

    void "Prueba: La accion 'edit' retorna el modelo correcto"() {
        when:"La accion 'edit' es ejecutada con un argumento"
            populateValidParams(params)
            def user = new User(params)
            controller.edit(user)

        then:"Un modelo es cargado conteniendo la instancia del argumento"
            model.userInstance == user
    }

    void "La accion 'borrar' borra correctamente una instancia si existe"() {
        when:"La accion es llamada sin un argumento"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'DELETE'
            controller.delete(null)

        then:"Retorna error 404"
            response.redirectedUrl == '/user/index'
            flash.message != null

        when:"Se crea una instancia de dominio"
            response.reset()
            populateValidParams(params)
            def user = new User(params).save(flush: true)

        then:"Existe"
			flash.message != null

        when:"Se pasa dicha instancia a la accion borrar"
            controller.delete(user)

        then:"La instancia se elimina"
            User.count() == 0
            response.redirectedUrl == '/user/index'
            flash.message != null
    }
}
