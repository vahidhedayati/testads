package ajaxdependancyselectexample

import grails.converters.JSON

import org.springframework.dao.DataIntegrityViolationException

class MyContinentController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }
   def issue14() {
}
	
	def estado() { 
}
	
	def example() {
        render (view: 'example', model: [params: params])

    }
	def example2() {
        render (view: 'example2', model: [params: params])

    }
	def example3() {
        render (view: 'example3', model: [params: params])

    }
	def example4() {
        render (view: 'example4', model: [params: params])

    }
	def norefselectionext() {
        render (view: 'norefselectionext', model: [params: params])

    }
	def multidomainexample() {
        render (view: 'multidomainexample', model: [params: params])
    }
	def norefselection() {
        render (view: 'norefselection', model: [params: params])
    }
	def customexample() {
        render (view: 'customexample', model: [params: params])

    }
	def customexample2() {
        render (view: 'customexample2', model: [params: params])
    }
	def selectautoComplete() {
        render (view: 'selectautoComplete', model: [params: params])
    }
	def filteringExamples() {
        render (view: 'filteringExamples', model: [params: params])
    }
	def filteringExample1() {
        render (view: 'filteringExample1', model: [params: params])
    }
	def noRefAutoComplete() {
        render (view: 'noRefAutoComplete', model: [params: params])
    }
	def selectauto2() {
        render (view: 'selectauto2', model: [params: params])
    }
	def selectauto3() {
        render (view: 'selectauto3', model: [params: params])
    }
	def selectPrimaryNRExample() {
        render (view: 'selectPrimaryNRExample', model: [params: params])
    }
	def selectPrimaryNRFiltering() {
        render (view: 'selectPrimaryNRFiltering', model: [params: params])
    }
	def testedit() {
        render (view: 'testedit', model: [params: params])
    }

    def selectcontroller() {
        render (view: 'selectcontroller', model: [params: params])
    }
	def norefselectSecondaryFilteringFixed() {
        render (view: 'norefselectSecondaryFilteringFixed', model: [params: params])
    }

	def norefselectSecondaryFiltering() {
        render (view: 'norefselectSecondaryFiltering', model: [params: params])
    }

	def example5() {
        render (view: 'example5', model: [params: params])

    }
	
	def listCountry() {
		
		def primarySelectList = []
		def primaryMap = [:]
		primaryMap.put('id', '')
		primaryMap.put('name', 'Select Country')
		primarySelectList.add(primaryMap)
		MyContinent.get(params.id).mycountry.each {
			primaryMap = [:]
			primaryMap.put('id', it.id)
			primaryMap.put('name', it.countryName)
			primarySelectList.add(primaryMap)
		}
			render primarySelectList as JSON
	}
	
	
	
	def selectCountries() {
		if (params.id) {
			println params
			String continentName = params.searchField
			Long continentId = params.id as Long
			MyContinent continent = MyContinent.get(continentId)
			
			/* Either this method or below method which is much shorter
			def primarySelectList = []
			MyCountry.findAllByMycontinentAndCountryNameLike(continent, "F%").each {
				def primaryMap = [:]
				primaryMap.put('id', it.id)
				primaryMap.put('name', it.countryName)
				primarySelectList.add(primaryMap)
			}
			render primarySelectList as JSON
			*/
			// Shorter method
			def countries=MyCountry.findAllByMycontinentAndCountryNameLike(continent, "F%")
			def results = countries.collect {[	'id': it.id, 'name': it.countryName ]}.unique()
			render results as JSON
		}
	}
	
    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [myContinentInstanceList: MyContinent.list(params), myContinentInstanceTotal: MyContinent.count()]
    }

    def create() {
        [myContinentInstance: new MyContinent(params)]
    }

    def save() {
        def myContinentInstance = new MyContinent(params)
        if (!myContinentInstance.save(flush: true)) {
            render(view: "create", model: [myContinentInstance: myContinentInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'myContinent.label', default: 'MyContinent'), myContinentInstance.id])
        redirect(action: "show", id: myContinentInstance.id)
    }

    def show(Long id) {
        def myContinentInstance = MyContinent.get(id)
        if (!myContinentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'myContinent.label', default: 'MyContinent'), id])
            redirect(action: "list")
            return
        }

        [myContinentInstance: myContinentInstance]
    }

    def edit(Long id) {
        def myContinentInstance = MyContinent.get(id)
        if (!myContinentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'myContinent.label', default: 'MyContinent'), id])
            redirect(action: "list")
            return
        }

        [myContinentInstance: myContinentInstance]
    }

    def update(Long id, Long version) {
        def myContinentInstance = MyContinent.get(id)
        if (!myContinentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'myContinent.label', default: 'MyContinent'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (myContinentInstance.version > version) {
                myContinentInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'myContinent.label', default: 'MyContinent')] as Object[],
                          "Another user has updated this MyContinent while you were editing")
                render(view: "edit", model: [myContinentInstance: myContinentInstance])
                return
            }
        }

        myContinentInstance.properties = params

        if (!myContinentInstance.save(flush: true)) {
            render(view: "edit", model: [myContinentInstance: myContinentInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'myContinent.label', default: 'MyContinent'), myContinentInstance.id])
        redirect(action: "show", id: myContinentInstance.id)
    }

    def delete(Long id) {
        def myContinentInstance = MyContinent.get(id)
        if (!myContinentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'myContinent.label', default: 'MyContinent'), id])
            redirect(action: "list")
            return
        }

        try {
            myContinentInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'myContinent.label', default: 'MyContinent'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'myContinent.label', default: 'MyContinent'), id])
            redirect(action: "show", id: id)
        }
    }
}
