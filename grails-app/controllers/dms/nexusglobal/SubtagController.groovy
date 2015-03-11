package dms.nexusglobal



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SubtagController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Subtag.list(params), model:[subtagInstanceCount: Subtag.count()]
    }

    def show(Subtag subtagInstance) {
        respond subtagInstance
    }

    def create() {
        respond new Subtag(params)
    }

    @Transactional
    def save(Subtag subtagInstance) {
        if (subtagInstance == null) {
            notFound()
            return
        }

        if (subtagInstance.hasErrors()) {
            respond subtagInstance.errors, view:'create'
            return
        }

        subtagInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'subtagInstance.label', default: 'Subtag'), subtagInstance.id])
                redirect subtagInstance
            }
            '*' { respond subtagInstance, [status: CREATED] }
        }
    }

    def edit(Subtag subtagInstance) {
        respond subtagInstance
    }

    @Transactional
    def update(Subtag subtagInstance) {
        if (subtagInstance == null) {
            notFound()
            return
        }

        if (subtagInstance.hasErrors()) {
            respond subtagInstance.errors, view:'edit'
            return
        }

        subtagInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Subtag.label', default: 'Subtag'), subtagInstance.id])
                redirect subtagInstance
            }
            '*'{ respond subtagInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Subtag subtagInstance) {

        if (subtagInstance == null) {
            notFound()
            return
        }

        subtagInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Subtag.label', default: 'Subtag'), subtagInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'subtagInstance.label', default: 'Subtag'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
