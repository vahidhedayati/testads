package ajaxdependancyselectexample



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class StreetsController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Streets.list(params), model:[streetsInstanceCount: Streets.count()]
    }

    def show(Streets streetsInstance) {
        respond streetsInstance
    }

    def create() {
        respond new Streets(params)
    }

    @Transactional
    def save(Streets streetsInstance) {
        if (streetsInstance == null) {
            notFound()
            return
        }

        if (streetsInstance.hasErrors()) {
            respond streetsInstance.errors, view:'create'
            return
        }

        streetsInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'streetsInstance.label', default: 'Streets'), streetsInstance.id])
                redirect streetsInstance
            }
            '*' { respond streetsInstance, [status: CREATED] }
        }
    }

    def edit(Streets streetsInstance) {
        respond streetsInstance
    }

    @Transactional
    def update(Streets streetsInstance) {
        if (streetsInstance == null) {
            notFound()
            return
        }

        if (streetsInstance.hasErrors()) {
            respond streetsInstance.errors, view:'edit'
            return
        }

        streetsInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Streets.label', default: 'Streets'), streetsInstance.id])
                redirect streetsInstance
            }
            '*'{ respond streetsInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Streets streetsInstance) {

        if (streetsInstance == null) {
            notFound()
            return
        }

        streetsInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Streets.label', default: 'Streets'), streetsInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'streetsInstance.label', default: 'Streets'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
