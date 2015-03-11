package ajaxdependancyselectexample



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class MyShopsController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond MyShops.list(params), model:[myShopsInstanceCount: MyShops.count()]
    }

    def show(MyShops myShopsInstance) {
        respond myShopsInstance
    }

    def create() {
        respond new MyShops(params)
    }

    @Transactional
    def save(MyShops myShopsInstance) {
        if (myShopsInstance == null) {
            notFound()
            return
        }

        if (myShopsInstance.hasErrors()) {
            respond myShopsInstance.errors, view:'create'
            return
        }

        myShopsInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'myShopsInstance.label', default: 'MyShops'), myShopsInstance.id])
                redirect myShopsInstance
            }
            '*' { respond myShopsInstance, [status: CREATED] }
        }
    }

    def edit(MyShops myShopsInstance) {
        respond myShopsInstance
    }

    @Transactional
    def update(MyShops myShopsInstance) {
        if (myShopsInstance == null) {
            notFound()
            return
        }

        if (myShopsInstance.hasErrors()) {
            respond myShopsInstance.errors, view:'edit'
            return
        }

        myShopsInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'MyShops.label', default: 'MyShops'), myShopsInstance.id])
                redirect myShopsInstance
            }
            '*'{ respond myShopsInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(MyShops myShopsInstance) {

        if (myShopsInstance == null) {
            notFound()
            return
        }

        myShopsInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'MyShops.label', default: 'MyShops'), myShopsInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'myShopsInstance.label', default: 'MyShops'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
