import UIKit

class DepartmentViewController: BaseDepartmentViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var emptyMaskView: EmptyMaskView!
    
    var districts: [District] = []
    var filteredDistricts: [District] = []
    var departmentPresenter: IDepartmentPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: DepartmentTableViewCell.className, bundle: nil), forCellReuseIdentifier: DepartmentTableViewCell.className)
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        searchBar.setCancelButtonTitle(LocalizableStrings.cancel.localized)
        searchBar.placeholder = LocalizableStrings.search.localized
        self.navigationItem.titleView = searchBar
        departmentPresenter = DepartmentPresenter(withDepartmentView: self as IDepartmentView, withDepartmentService: DepartmentService())
    }
    
    
    override func loadScreenData() {
        departmentPresenter?.onGetDistrictsWithDepartments()
    }
}

extension DepartmentViewController: IDepartmentView {
    
    func onLoadingData() -> Void {
       loaderScreen.show()
    }
    
    func onLoadingDataFinished() -> Void {
        loaderScreen.hide()
    }
    
    func onDistrictsLoaded(_ districts: [District]) -> Void {
        self.districts = districts
        self.filteredDistricts = districts
        self.searchBar.isHidden = districts.isEmpty
        self.tableView.isHidden = districts.isEmpty
        self.emptyMaskView.isHidden = !districts.isEmpty
        self.emptyMaskView.setupForType(.noDepartments)
    }
    
    func onDistrictsFailed() -> Void {
        //TODO:
    }
    
    func onDistrictFilterResult(districts: [District]) -> Void {
        self.filteredDistricts = districts
        self.tableView.isHidden = districts.isEmpty
        self.emptyMaskView.isHidden = !districts.isEmpty
        self.emptyMaskView.setupForType(.noDepartmentsFilterResult)
    }
    
    func onRefreshView() -> Void {
        self.tableView.reloadData()
    }
    
    func onHideKeyboard() -> Void {
        self.searchBar.resignFirstResponder()
    }
    
    func onCleanSearchBar() -> Void {
        self.searchBar.text = "";
    }
}

extension DepartmentViewController: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.departmentPresenter?.onCleanSearchField()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.departmentPresenter?.onFilterDistinctsByText(searchText)
    }
    
}

extension DepartmentViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return filteredDistricts.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredDistricts[section].departments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: DepartmentTableViewCell = tableView.dequeueReusableCell(withIdentifier: DepartmentTableViewCell.className, for: indexPath) as! DepartmentTableViewCell
        cell.loadFromData(filteredDistricts[indexPath.section].departments[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return filteredDistricts[section].name
    }
}
