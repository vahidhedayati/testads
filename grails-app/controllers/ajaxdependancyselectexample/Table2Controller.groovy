package ajaxdependancyselectexample



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class Table2Controller {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Table2.list(params), model:[table2InstanceCount: Table2.count()]
    }

    def show(Table2 table2Instance) {
        respond table2Instance
    }

    def create() {
        respond new Table2(params)
    }

    @Transactional
    def save(Table2 table2Instance) {
        if (table2Instance == null) {
            notFound()
            return
        }

        if (table2Instance.hasErrors()) {
            respond table2Instance.errors, view:'create'
            return
        }

        table2Instance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'table2Instance.label', default: 'Table2'), table2Instance.id])
                redirect table2Instance
            }
            '*' { respond table2Instance, [status: CREATED] }
        }
    }

    def edit(Table2 table2Instance) {
        respond table2Instance
    }

    @Transactional
    def update(Table2 table2Instance) {
        if (table2Instance == null) {
            notFound()
            return
        }

        if (table2Instance.hasErrors()) {
            respond table2Instance.errors, view:'edit'
            return
        }

        table2Instance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Table2.label', default: 'Table2'), table2Instance.id])
                redirect table2Instance
            }
            '*'{ respond table2Instance, [status: OK] }
        }
    }

    @Transactional
    def delete(Table2 table2Instance) {

        if (table2Instance == null) {
            notFound()
            return
        }

        table2Instance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Table2.label', default: 'Table2'), table2Instance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'table2Instance.label', default: 'Table2'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
