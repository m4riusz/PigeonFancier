import UIKit

struct DepartmentCellData {
    let title: String?
    let className: String
    let data: [[String: Any]]
}

enum CellType: String {
    case none = ""
    case map = "ic_gps"
    case phone = "ic_phone"
    case email = "ic_email"
}

protocol IDepartmentDetailView {
    
    func onLoadingData() -> Void
    func onLoadingDataFinished() -> Void
    func onDepartmentDetailLoaded(_ department: Department) -> Void
    func onDepartmentDetailFailed() -> Void
    
}

class DepartmentDetailViewController: BaseDepartmentViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var departmentNumber: String?
    var data: [DepartmentCellData] = []
    var departmentDetailPreseneter: IDepartmentDetailPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        departmentDetailPreseneter = DepartmentDetailPresenter(withDepartmentDetailView: self as IDepartmentDetailView, withDepartmentService: DepartmentService())
        tableView.register(UINib(nibName: DepartmentDetailHeaderTableViewCell.className, bundle: nil), forCellReuseIdentifier: DepartmentDetailHeaderTableViewCell.className)
        tableView.register(UINib(nibName: DepartmentDetailTableViewCell.className, bundle: nil), forCellReuseIdentifier: DepartmentDetailTableViewCell.className)
    }
    
    override func loadScreenData() {
        if (departmentNumber != nil) {
            departmentDetailPreseneter!.onGetDepartmentDetails(evidenceNumber: departmentNumber!)
        }
    }
    
}

extension DepartmentDetailViewController: IDepartmentDetailView {
    
    func onLoadingData() -> Void {
        loaderScreen.show()
    }
    
    func onLoadingDataFinished() -> Void {
        loaderScreen.hide()
    }
    
    func onDepartmentDetailLoaded(_ department: Department) -> Void {
        data = []
        data.append(DepartmentCellData(title: nil,
                                       className: DepartmentDetailHeaderTableViewCell.className,
                                       data: [
                                        ["EvidenceNumber" : department.evidenceNumber,
                                         "Name" : department.name,
                                         "Favourite" : department.favourite]
            ])
        )
        
        if let person = department.owner {
            let fullName = "\(person.firstName ?? "") \(person.lastName ?? "")"
            if !fullName.isEmpty {
                data.append(DepartmentCellData(title: LocalizableStrings.personalData.localized,
                                               className: DepartmentDetailTableViewCell.className,
                                               data: [
                                                ["title" : fullName, "icon" : CellType.none]
                    ])
                )
            }
        }
        if let address = department.address {
            let items: [String] = [address.street, address.postalCode, address.city].compactMap{ $0 }
            if items.count > 0 {
                data.append(DepartmentCellData(title: LocalizableStrings.address.localized,
                                               className: DepartmentDetailTableViewCell.className,
                                               data: [
                                                ["title" : items.joined(separator: " "), "icon" : CellType.map]
                    ])
                )
            }
        }
        
        if let phones = department.owner?.phoneNumber {
            let items = phones.map{["title" : $0, "icon" : CellType.phone]}
            if items.count > 0 {
                data.append(DepartmentCellData(title: LocalizableStrings.phone.localized,
                                               className: DepartmentDetailTableViewCell.className,
                                               data: items)
                )
            }
        }
        
        if let emails = department.owner?.email {
            let items = emails.map{["title" : $0, "icon" : CellType.email]}
            if items.count > 0 {
                data.append(DepartmentCellData(title: LocalizableStrings.email.localized,
                                               className: DepartmentDetailTableViewCell.className,
                                               data: items)
                )
            }
        }
        tableView.reloadData()
    }
    
    func onDepartmentDetailFailed() -> Void {
        loaderScreen.error()
    }
}


extension DepartmentDetailViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].data.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return data[section].title
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: data[indexPath.section].className, for: indexPath)
        if let loadDataCell = cell as? DataSourceLoading {
            loadDataCell.loadFromData(data[indexPath.section].data[indexPath.row])
        }
        return cell
    }
}
