
protocol IDepartmentPresenter {
    
    func onFilterDistinctsByText(_ text: String) -> Void
    func onCleanSearchField() -> Void
    func onGetDistrictsWithDepartments() -> Void
    
}

class DepartmentPresenter: IDepartmentPresenter {
    
    let departmentView: IDepartmentView
    let departmentService: IDepartmentService
    
    var districts: [District] = []
    
    init(withDepartmentView view: IDepartmentView, withDepartmentService service: IDepartmentService) {
        self.departmentView = view
        self.departmentService = service
    }
    
    func onFilterDistinctsByText(_ text: String) -> Void {
        
        guard !text.isEmpty else {
            self.departmentView.onDistrictFilterResult(districts: districts)
            self.departmentView.onRefreshView()
            return
        }
        
        let lowercasedSearchText = text.lowercased()
        let departmentFilter: (Department) -> Bool = {(department) -> Bool in
            return department.name.lowercased().contains(lowercasedSearchText) || department.evidenceNumber.lowercased().contains(lowercasedSearchText)
        }
        
        let filteredDistinctsTmp = districts.filter({ (distinct) -> Bool in
            return distinct.departments.contains(where: departmentFilter)
        })
        let filteredDistricts: [District] = filteredDistinctsTmp.map({ (distinct) -> District in
            let filteredDepartments = distinct.departments.filter(departmentFilter)
            return District(name: distinct.name, president: distinct.president, address: distinct.address, departments: filteredDepartments)
        })
        self.departmentView.onDistrictFilterResult(districts: filteredDistricts)
        self.departmentView.onRefreshView()
    }
    
    func onCleanSearchField() -> Void {
        self.onFilterDistinctsByText("")
        self.departmentView.onHideKeyboard()
        self.departmentView.onCleanSearchBar()
    }
    
    func onGetDistrictsWithDepartments() -> Void {
        departmentView.onLoadingData()
        departmentService.getDistinctsWithDepartments(successCallback: { (districts) in
            self.districts = districts
            self.departmentView.onDistrictsLoaded(districts)
            self.departmentView.onLoadingDataFinished()
            self.departmentView.onRefreshView()
        }) { (error) in
            self.departmentView.onDistrictsFailed()
            self.departmentView.onLoadingDataFinished()
        }
    }
}
