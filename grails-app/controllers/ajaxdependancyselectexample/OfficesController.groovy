package ajaxdependancyselectexample



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class OfficesController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Offices.list(params), model:[officesInstanceCount: Offices.count()]
    }

    def show(Offices officesInstance) {
        respond officesInstance
    }

    def create() {
        respond new Offices(params)
    }

    @Transactional
    def save(Offices officesInstance) {
        if (officesInstance == null) {
            notFound()
            return
        }

        if (officesInstance.hasErrors()) {
            respond officesInstance.errors, view:'create'
            return
        }

        officesInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'officesInstance.label', default: 'Offices'), officesInstance.id])
                redirect officesInstance
            }
            '*' { respond officesInstance, [status: CREATED] }
        }
    }

    def edit(Offices officesInstance) {
        respond officesInstance
    }

    @Transactional
    def update(Offices officesInstance) {
        if (officesInstance == null) {
            notFound()
            return
        }

        if (officesInstance.hasErrors()) {
            respond officesInstance.errors, view:'edit'
            return
        }

        officesInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Offices.label', default: 'Offices'), officesInstance.id])
                redirect officesInstance
            }
            '*'{ respond officesInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Offices officesInstance) {

        if (officesInstance == null) {
            notFound()
            return
        }

        officesInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Offices.label', default: 'Offices'), officesInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'officesInstance.label', default: 'Offices'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
