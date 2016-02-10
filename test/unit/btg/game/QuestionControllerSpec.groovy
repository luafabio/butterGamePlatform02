package btg.game



import grails.test.mixin.*
import spock.lang.*

@TestFor(QuestionController)
@Mock(Question)
class QuestionControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
//        TODO: Populate valid properties like...
        params["name"] = 'algunaPregunta'
    }

    void "Prueba: la accion 'index' retorna el modelo correcto"() {

        when:"La accion index es ejecutada"
            controller.index()

        then:"El modelo es el correcto"
            !model.questionInstanceList
            model.questionInstanceCount == 0
    }

    void "Prueba: la accion 'crear' retorna el modelo correcto"() {
        when:"La accion create es ejecutada"
            controller.create()

        then:"El modelo se creo correctamente"
            model.questionInstance!= null
    }

    void "Prueba: la accion 'guardar' persiste correctamente"() {

        when:"La accion guardar es ejecutada con una instancia invalida"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def question = new Question()
            question.validate()
            controller.save(question)

        then:"La vista de creacion se renderiza nuevamente con el modelo correcto"
            model.questionInstance!= null
            view == 'create'

        when:"La opcion guardar es ejecutada con una instancia valida"
            response.reset()
            populateValidParams(params)
            question = new Question(params)

            controller.save(question)

        then:"Se redirecciona a la accion home"
            response.redirectedUrl == '/user/home'
            controller.flash.message != null
    }

    void "Prueba: La accion 'mostrar' retorna el modelo correcto"() {
        when:"La accion mostrar es ejecutada con argumento null"
            controller.show(null)

        then:"Retorna error 404"
            response.status == 404

        when:"La accion mostrar es ejecutada con un argumento"
            populateValidParams(params)
            def question = new Question(params)
            controller.show(question)

        then:"Un modelo es cargado conteniendo la instancia del argumento"
            model.questionInstance == question
    }

    void "Prueba: La accion 'edit' retorna el modelo correcto"() {
        when:"La accion 'edit' es ejecutada con argumento null"
            controller.edit(null)

        then:"Retorna error 404"
            response.status == 404

        when:"La accion 'edit' es ejecutada con un argumento"
            populateValidParams(params)
            def question = new Question(params)
            controller.edit(question)

        then:"Un modelo es cargado conteniendo la instancia del argumento"
            model.questionInstance == question
    }

    void "Prueba: la accion 'actualizar' actualiza correctamente una instancia"() {
        when:"La accion actualizar es llamada por una instancia inexistente"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'PUT'
            controller.update(null)

        then:"Retorna error 404"
            response.redirectedUrl == '/question/index'
            flash.message != null


        when:"Se envia un argumento invalido"
            response.reset()
            def question = new Question()
            question.validate()
            controller.update(question)

        then:"La vista de edicion se renderiza nuevamente con la instancia invalida"
            view == 'edit'
            model.questionInstance == question

        when:"Se envia una instancia valida"
            response.reset()
            populateValidParams(params)
            question = new Question(params).save(flush: true)
            controller.update(question)

        then:"Se redirecciona al index"
            response.redirectedUrl == "/question/index"
            flash.message != null
    }

    void "La accion 'borrar' borra correctamente una instancia si existe"() {
        when:"La accion es llamada sin un argumento"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'DELETE'
            controller.delete(null)

        then:"Retorna error 404"
            response.redirectedUrl == '/question/index'
            flash.message != null

        when:"Se crea una instancia de dominio"
            response.reset()
            populateValidParams(params)
            def question = new Question(params).save(flush: true)

        then:"Existe"
            flash.message != null
			
        when:"Se pasa dicha instancia a la accion borrar"
            controller.delete(question)

        then:"La instancia se elimina"
            Question.count() == 0
            response.redirectedUrl == '/question/index'
            flash.message != null
    }
}
