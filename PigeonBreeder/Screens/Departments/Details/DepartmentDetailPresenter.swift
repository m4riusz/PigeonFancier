
protocol IDepartmentDetailPresenter {
    
    func onGetDepartmentDetails(evidenceNumber number: String) -> Void
    
}

class DepartmentDetailPresenter: IDepartmentDetailPresenter {
    
    let departmentDetailView: IDepartmentDetailView
    let departmentService: IDepartmentService
    
    init(withDepartmentDetailView departmentDetailView: IDepartmentDetailView, withDepartmentService departmentService: IDepartmentService) {
        self.departmentDetailView = departmentDetailView
        self.departmentService = departmentService
    }

    func onGetDepartmentDetails(evidenceNumber number: String) -> Void {
        departmentDetailView.onLoadingData()
        departmentService.getDepartmentWithEvidenceNumber(number, successCallback: { (department) in
            self.departmentDetailView.onDepartmentDetailLoaded(department)
            self.departmentDetailView.onLoadingDataFinished()
        }) { (error) in
            self.departmentDetailView.onDepartmentDetailFailed()
        }
    }
}
