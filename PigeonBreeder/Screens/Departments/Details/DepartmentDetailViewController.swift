import UIKit

struct DepartmentCellData {
    let title: String?
    let className: String
    let data: [Any]
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
                                        DepartmentDetailHeaderTableViewCellData(
                                            evidenceNumber: department.evidenceNumber,
                                            departmentName: department.name,
                                            favourite: department.favourite)
                                        ])
        )
        
        if let person = department.owner {
            let fullName = "\(person.firstName ?? "") \(person.lastName ?? "")"
            if !fullName.isEmpty {
                data.append(DepartmentCellData(title: LocalizableStrings.personalData.localized,
                                               className: DepartmentDetailTableViewCell.className,
                                               data: [
                                                DepartmentDetailTableViewCellData(title: fullName, type: .none)
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
                                                DepartmentDetailTableViewCellData(title: items.joined(separator: " "), type: .map)
                                                ])
                )
            }
        }
        
        if let phones = department.owner?.phoneNumber {
            let items = phones.map{ DepartmentDetailTableViewCellData(title: $0, type: .phone)}
            if items.count > 0 {
                data.append(DepartmentCellData(title: LocalizableStrings.phone.localized,
                                               className: DepartmentDetailTableViewCell.className,
                                               data: items)
                )
            }
        }
        
        if let emails = department.owner?.email {
            let items = emails.map{ DepartmentDetailTableViewCellData(title: $0, type: .email)}
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

extension DepartmentDetailViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.section != 0 else {
            return
        }
        if let itemData: DepartmentDetailTableViewCellData = data[indexPath.section].data[indexPath.row] as? DepartmentDetailTableViewCellData {
            switch itemData.type {
            case .email:
                AppHelper.mailTo(itemData.title)
                break
            case .phone:
                AppHelper.callNumber(itemData.title)
                break
            case .map:
                AppHelper.navigateToAddress(itemData.title)
                break
            default:
                return
            }
        }
        
        
        
        
    }
}
