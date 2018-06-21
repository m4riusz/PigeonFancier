
protocol IDepartmentView {
    
    func onLoadingData() -> Void
    func onLoadingDataFinished() -> Void
    func onDistrictsLoaded(_ districts: [District]) -> Void
    func onDistrictsFailed() -> Void
    func onDistrictFilterResult(districts: [District]) -> Void
    func onRefreshView() -> Void
    func onHideKeyboard() -> Void
    func onCleanSearchBar() -> Void
    
}

protocol IDepartmentPresenter {

    func onFilterDistinctsByText(_ text: String) -> Void
    func onCleanSearchField() -> Void
    func onGetDistrictsWithDepartments() -> Void
   
}

protocol IDepartmentService {
    
    func getDistinctsWithDepartments(successCallback: (@escaping ([District]) -> Void), errorBlock: (@escaping (Error) -> Void)) -> Void
    
}

