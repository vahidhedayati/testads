package ajaxdependancyselectexample



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class MyBoroughController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond MyBorough.list(params), model:[myBoroughInstanceCount: MyBorough.count()]
    }

    def show(MyBorough myBoroughInstance) {
        respond myBoroughInstance
    }

    def create() {
        respond new MyBorough(params)
    }

    @Transactional
    def save(MyBorough myBoroughInstance) {
        if (myBoroughInstance == null) {
            notFound()
            return
        }

        if (myBoroughInstance.hasErrors()) {
            respond myBoroughInstance.errors, view:'create'
            return
        }

        myBoroughInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'myBoroughInstance.label', default: 'MyBorough'), myBoroughInstance.id])
                redirect myBoroughInstance
            }
            '*' { respond myBoroughInstance, [status: CREATED] }
        }
    }

    def edit(MyBorough myBoroughInstance) {
        respond myBoroughInstance
    }

    @Transactional
    def update(MyBorough myBoroughInstance) {
        if (myBoroughInstance == null) {
            notFound()
            return
        }

        if (myBoroughInstance.hasErrors()) {
            respond myBoroughInstance.errors, view:'edit'
            return
        }

        myBoroughInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'MyBorough.label', default: 'MyBorough'), myBoroughInstance.id])
                redirect myBoroughInstance
            }
            '*'{ respond myBoroughInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(MyBorough myBoroughInstance) {

        if (myBoroughInstance == null) {
            notFound()
            return
        }

        myBoroughInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'MyBorough.label', default: 'MyBorough'), myBoroughInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'myBoroughInstance.label', default: 'MyBorough'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
