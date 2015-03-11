package ajaxdependancyselectexample



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class DepartmentsController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Departments.list(params), model:[departmentsInstanceCount: Departments.count()]
    }

    def show(Departments departmentsInstance) {
        respond departmentsInstance
    }

    def create() {
        respond new Departments(params)
    }

    @Transactional
    def save(Departments departmentsInstance) {
        if (departmentsInstance == null) {
            notFound()
            return
        }

        if (departmentsInstance.hasErrors()) {
            respond departmentsInstance.errors, view:'create'
            return
        }

        departmentsInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'departmentsInstance.label', default: 'Departments'), departmentsInstance.id])
                redirect departmentsInstance
            }
            '*' { respond departmentsInstance, [status: CREATED] }
        }
    }

    def edit(Departments departmentsInstance) {
        respond departmentsInstance
    }

    @Transactional
    def update(Departments departmentsInstance) {
        if (departmentsInstance == null) {
            notFound()
            return
        }

        if (departmentsInstance.hasErrors()) {
            respond departmentsInstance.errors, view:'edit'
            return
        }

        departmentsInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Departments.label', default: 'Departments'), departmentsInstance.id])
                redirect departmentsInstance
            }
            '*'{ respond departmentsInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Departments departmentsInstance) {

        if (departmentsInstance == null) {
            notFound()
            return
        }

        departmentsInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Departments.label', default: 'Departments'), departmentsInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'departmentsInstance.label', default: 'Departments'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
