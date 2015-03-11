package ajaxdependancyselectexample



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class Table1Controller {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Table1.list(params), model:[table1InstanceCount: Table1.count()]
    }

    def show(Table1 table1Instance) {
        respond table1Instance
    }

    def create() {
        respond new Table1(params)
    }

    @Transactional
    def save(Table1 table1Instance) {
        if (table1Instance == null) {
            notFound()
            return
        }

        if (table1Instance.hasErrors()) {
            respond table1Instance.errors, view:'create'
            return
        }

        table1Instance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'table1Instance.label', default: 'Table1'), table1Instance.id])
                redirect table1Instance
            }
            '*' { respond table1Instance, [status: CREATED] }
        }
    }

    def edit(Table1 table1Instance) {
        respond table1Instance
    }

    @Transactional
    def update(Table1 table1Instance) {
        if (table1Instance == null) {
            notFound()
            return
        }

        if (table1Instance.hasErrors()) {
            respond table1Instance.errors, view:'edit'
            return
        }

        table1Instance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Table1.label', default: 'Table1'), table1Instance.id])
                redirect table1Instance
            }
            '*'{ respond table1Instance, [status: OK] }
        }
    }

    @Transactional
    def delete(Table1 table1Instance) {

        if (table1Instance == null) {
            notFound()
            return
        }

        table1Instance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Table1.label', default: 'Table1'), table1Instance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'table1Instance.label', default: 'Table1'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
