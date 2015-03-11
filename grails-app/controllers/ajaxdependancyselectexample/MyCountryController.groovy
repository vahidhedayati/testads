package ajaxdependancyselectexample



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class MyCountryController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond MyCountry.list(params), model:[myCountryInstanceCount: MyCountry.count()]
    }


	
    def show(MyCountry myCountryInstance) {
        respond myCountryInstance
    }

    def create() {
        respond new MyCountry(params)
    }

    @Transactional
    def save(MyCountry myCountryInstance) {
        if (myCountryInstance == null) {
            notFound()
            return
        }

        if (myCountryInstance.hasErrors()) {
            respond myCountryInstance.errors, view:'create'
            return
        }

        myCountryInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'myCountryInstance.label', default: 'MyCountry'), myCountryInstance.id])
                redirect myCountryInstance
            }
            '*' { respond myCountryInstance, [status: CREATED] }
        }
    }

    def edit(MyCountry myCountryInstance) {
        respond myCountryInstance
    }

    @Transactional
    def update(MyCountry myCountryInstance) {
        if (myCountryInstance == null) {
            notFound()
            return
        }

        if (myCountryInstance.hasErrors()) {
            respond myCountryInstance.errors, view:'edit'
            return
        }

        myCountryInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'MyCountry.label', default: 'MyCountry'), myCountryInstance.id])
                redirect myCountryInstance
            }
            '*'{ respond myCountryInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(MyCountry myCountryInstance) {

        if (myCountryInstance == null) {
            notFound()
            return
        }

        myCountryInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'MyCountry.label', default: 'MyCountry'), myCountryInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'myCountryInstance.label', default: 'MyCountry'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
