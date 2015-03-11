package ajaxdependancyselectexample



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class MyCityController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond MyCity.list(params), model:[myCityInstanceCount: MyCity.count()]
    }

    def show(MyCity myCityInstance) {
        respond myCityInstance
    }

    def create() {
        respond new MyCity(params)
    }

    @Transactional
    def save(MyCity myCityInstance) {
        if (myCityInstance == null) {
            notFound()
            return
        }

        if (myCityInstance.hasErrors()) {
            respond myCityInstance.errors, view:'create'
            return
        }

        myCityInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'myCityInstance.label', default: 'MyCity'), myCityInstance.id])
                redirect myCityInstance
            }
            '*' { respond myCityInstance, [status: CREATED] }
        }
    }

    def edit(MyCity myCityInstance) {
        respond myCityInstance
    }

    @Transactional
    def update(MyCity myCityInstance) {
        if (myCityInstance == null) {
            notFound()
            return
        }

        if (myCityInstance.hasErrors()) {
            respond myCityInstance.errors, view:'edit'
            return
        }

        myCityInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'MyCity.label', default: 'MyCity'), myCityInstance.id])
                redirect myCityInstance
            }
            '*'{ respond myCityInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(MyCity myCityInstance) {

        if (myCityInstance == null) {
            notFound()
            return
        }

        myCityInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'MyCity.label', default: 'MyCity'), myCityInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'myCityInstance.label', default: 'MyCity'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
