package ajaxdependancyselectexample



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class DocumentsController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Documents.list(params), model:[documentsInstanceCount: Documents.count()]
    }

    def show(Documents documentsInstance) {
        respond documentsInstance
    }

    def create() {
        respond new Documents(params)
    }

    @Transactional
    def save(Documents documentsInstance) {
        if (documentsInstance == null) {
            notFound()
            return
        }

        if (documentsInstance.hasErrors()) {
            respond documentsInstance.errors, view:'create'
            return
        }

        documentsInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'documentsInstance.label', default: 'Documents'), documentsInstance.id])
                redirect documentsInstance
            }
            '*' { respond documentsInstance, [status: CREATED] }
        }
    }

    def edit(Documents documentsInstance) {
        respond documentsInstance
    }

    @Transactional
    def update(Documents documentsInstance) {
        if (documentsInstance == null) {
            notFound()
            return
        }

        if (documentsInstance.hasErrors()) {
            respond documentsInstance.errors, view:'edit'
            return
        }

        documentsInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Documents.label', default: 'Documents'), documentsInstance.id])
                redirect documentsInstance
            }
            '*'{ respond documentsInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Documents documentsInstance) {

        if (documentsInstance == null) {
            notFound()
            return
        }

        documentsInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Documents.label', default: 'Documents'), documentsInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'documentsInstance.label', default: 'Documents'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
