import UIKit

class DepartmentViewController: BaseDepartmentViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var emptyMaskView: EmptyMaskView!
    
    var distincts: [District]?
    var filteredDistincts: [District]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: DepartmentTableViewCell.className, bundle: nil), forCellReuseIdentifier: DepartmentTableViewCell.className)
        tableView.register(UINib(nibName: DepartmentEmptyTableViewCell.className, bundle: nil), forCellReuseIdentifier: DepartmentEmptyTableViewCell.className)
        emptyMaskView.setupForType(.noDepartments)
        distincts = [
                    District(name: "Biała Podlaska", president: Person(firstName: "Janusz", lastName: "Podlaski", phoneNumber: ["444-122-222"], email: nil), address: Address(street: "ul. Polna 18", city: "Biała Podlaska", postalCode: "99-123"), departments: [
                        Department(favourite: true, evidenceNumber: "07", name: "Biała Podlaska", owner: Person(firstName: "Janusz", lastName: "Piechociński", phoneNumber: ["111-111-111"], email: ["email@email.pl"]), address: Address(street: "ul Jana Pawła 2", city: "Opoczno", postalCode: "91-300")),
                        Department(favourite: false, evidenceNumber: "08", name: "Bełchatów", owner: Person(firstName: "Kamil", lastName: "Rybus", phoneNumber: ["111-111-111", "222-222-222"], email: nil), address: Address(street: "ul Pawła 2", city: "Bełchatów", postalCode: "90-300")),
                        Department(favourite: false, evidenceNumber: "09", name: "Biała Podlaska", owner: Person(firstName: "Janusz", lastName: "Piechociński", phoneNumber: ["111-111-111"], email: ["email@email.pl"]), address: Address(street: "ul Jana Pawła 2", city: "Opoczno", postalCode: "91-300")),
                        Department(favourite: false, evidenceNumber: "017", name: "Biała Podlaska", owner: Person(firstName: "Janusz", lastName: "Piechociński", phoneNumber: ["111-111-111"], email: ["email@email.pl"]), address: Address(street: "ul Jana Pawła 2", city: "Opoczno", postalCode: "91-300"))
                    ]),
                    District(name: "Lódź", president: Person(firstName: "Janusz", lastName: "Podlaski", phoneNumber: ["444-122-222"], email: nil), address: Address(street: "ul. Polna 18", city: "Biała Podlaska", postalCode: "99-123"), departments: [
                        Department(favourite: true, evidenceNumber: "07", name: "Biała Podlaska", owner: Person(firstName: "Janusz", lastName: "Piechociński", phoneNumber: ["111-111-111"], email: ["email@email.pl"]), address: Address(street: "ul Jana Pawła 2", city: "Opoczno", postalCode: "91-300")),
                        Department(favourite: false, evidenceNumber: "017", name: "Biała Podlaska", owner: Person(firstName: "Janusz", lastName: "Piechociński", phoneNumber: ["111-111-111"], email: ["email@email.pl"]), address: Address(street: "ul Jana Pawła 2", city: "Opoczno", postalCode: "91-300"))
                    ]),
                    District(name: "Piotrków Trybunalski", president: Person(firstName: "Janusz", lastName: "Podlaski", phoneNumber: ["444-122-222"], email: nil), address: Address(street: "ul. Polna 18", city: "Biała Podlaska", postalCode: "99-123"), departments: [
                        Department(favourite: true, evidenceNumber: "07", name: "Biała Podlaska", owner: Person(firstName: "Janusz", lastName: "Piechociński", phoneNumber: ["111-111-111"], email: ["email@email.pl"]), address: Address(street: "ul Jana Pawła 2", city: "Opoczno", postalCode: "91-300")),
                        Department(favourite: false, evidenceNumber: "08", name: "Bełchatów", owner: Person(firstName: "Kamil", lastName: "Rybus", phoneNumber: ["111-111-111", "222-222-222"], email: nil), address: Address(street: "ul Pawła 2", city: "Bełchatów", postalCode: "90-300")),
                        Department(favourite: true, evidenceNumber: "07", name: "Biała Podlaska", owner: Person(firstName: "Janusz", lastName: "Piechociński", phoneNumber: ["111-111-111"], email: ["email@email.pl"]), address: Address(street: "ul Jana Pawła 2", city: "Opoczno", postalCode: "91-300")),
                        Department(favourite: false, evidenceNumber: "08", name: "Bełchatów", owner: Person(firstName: "Kamil", lastName: "Rybus", phoneNumber: ["111-111-111", "222-222-222"], email: nil), address: Address(street: "ul Pawła 2", city: "Bełchatów", postalCode: "90-300")),
                        Department(favourite: false, evidenceNumber: "09", name: "Biała Podlaska", owner: Person(firstName: "Janusz", lastName: "Piechociński", phoneNumber: ["111-111-111"], email: ["email@email.pl"]), address: Address(street: "ul Jana Pawła 2", city: "Opoczno", postalCode: "91-300")),
                        Department(favourite: false, evidenceNumber: "017", name: "Biała Podlaska", owner: Person(firstName: "Janusz", lastName: "Piechociński", phoneNumber: ["111-111-111"], email: ["email@email.pl"]), address: Address(street: "ul Jana Pawła 2", city: "Opoczno", postalCode: "91-300"))
                        ]),
                    District(name: "Biała Podlaska", president: Person(firstName: "Janusz", lastName: "Podlaski", phoneNumber: ["444-122-222"], email: nil), address: Address(street: "ul. Polna 18", city: "Biała Podlaska", postalCode: "99-123"), departments: [
                        Department(favourite: true, evidenceNumber: "07", name: "Biała Podlaska", owner: Person(firstName: "Janusz", lastName: "Piechociński", phoneNumber: ["111-111-111"], email: ["email@email.pl"]), address: Address(street: "ul Jana Pawła 2", city: "Opoczno", postalCode: "91-300")),
                        Department(favourite: false, evidenceNumber: "08", name: "AAAAA", owner: Person(firstName: "Kamil", lastName: "Rybus", phoneNumber: ["111-111-111", "222-222-222"], email: nil), address: Address(street: "ul Pawła 2", city: "Bełchatów", postalCode: "90-300")),
                        Department(favourite: false, evidenceNumber: "09", name: "Biała Podlaska", owner: Person(firstName: "Janusz", lastName: "Piechociński", phoneNumber: ["111-111-111"], email: ["email@email.pl"]), address: Address(street: "ul Jana Pawła 2", city: "Opoczno", postalCode: "91-300")),
                        Department(favourite: false, evidenceNumber: "017", name: "Biała Podlaska", owner: Person(firstName: "Janusz", lastName: "Piechociński", phoneNumber: ["111-111-111"], email: ["email@email.pl"]), address: Address(street: "ul Jana Pawła 2", city: "Opoczno", postalCode: "91-300"))
                        ]),
                    District(name: "Lódź", president: Person(firstName: "Janusz", lastName: "Podlaski", phoneNumber: ["444-122-222"], email: nil), address: Address(street: "ul. Polna 18", city: "Biała Podlaska", postalCode: "99-123"), departments: [
                        Department(favourite: true, evidenceNumber: "07", name: "Biała Podlaska", owner: Person(firstName: "Janusz", lastName: "Piechociński", phoneNumber: ["111-111-111"], email: ["email@email.pl"]), address: Address(street: "ul Jana Pawła 2", city: "Opoczno", postalCode: "91-300")),
                        Department(favourite: false, evidenceNumber: "017", name: "Biała Podlaska", owner: Person(firstName: "Janusz", lastName: "Piechociński", phoneNumber: ["111-111-111"], email: ["email@email.pl"]), address: Address(street: "ul Jana Pawła 2", city: "Opoczno", postalCode: "91-300"))
                        ]),
                    District(name: "Piotrków Trybunalski", president: Person(firstName: "Janusz", lastName: "Podlaski", phoneNumber: ["444-122-222"], email: nil), address: Address(street: "ul. Polna 18", city: "Biała Podlaska", postalCode: "99-123"), departments: [
                        Department(favourite: true, evidenceNumber: "07", name: "Aaaa", owner: Person(firstName: "Janusz", lastName: "Piechociński", phoneNumber: ["111-111-111"], email: ["email@email.pl"]), address: Address(street: "ul Jana Pawła 2", city: "Opoczno", postalCode: "91-300")),
                        Department(favourite: false, evidenceNumber: "08", name: "Bełchatów", owner: Person(firstName: "Kamil", lastName: "Rybus", phoneNumber: ["111-111-111", "222-222-222"], email: nil), address: Address(street: "ul Pawła 2", city: "Bełchatów", postalCode: "90-300")),
                        Department(favourite: true, evidenceNumber: "07", name: "Biała Podlaska", owner: Person(firstName: "Janusz", lastName: "Piechociński", phoneNumber: ["111-111-111"], email: ["email@email.pl"]), address: Address(street: "ul Jana Pawła 2", city: "Opoczno", postalCode: "91-300")),
                        Department(favourite: false, evidenceNumber: "08", name: "Bełchatów", owner: Person(firstName: "Kamil", lastName: "Rybus", phoneNumber: ["111-111-111", "222-222-222"], email: nil), address: Address(street: "ul Pawła 2", city: "Bełchatów", postalCode: "90-300")),
                        Department(favourite: false, evidenceNumber: "09", name: "Biała Podlaska", owner: Person(firstName: "Janusz", lastName: "Piechociński", phoneNumber: ["111-111-111"], email: ["email@email.pl"]), address: Address(street: "ul Jana Pawła 2", city: "Opoczno", postalCode: "91-300")),
                        Department(favourite: false, evidenceNumber: "017", name: "Biała Podlaska", owner: Person(firstName: "Janusz", lastName: "Piechociński", phoneNumber: ["111-111-111"], email: ["email@email.pl"]), address: Address(street: "ul Jana Pawła 2", city: "Opoczno", postalCode: "91-300"))
                        ])
        ]
        filteredDistincts = distincts
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        updateMaskView()
    }
    
    func updateMaskView() -> Void {
        tableView.isHidden = distincts?.count == 0
        emptyMaskView.isHidden = distincts?.count != 0
    }
}

extension DepartmentViewController: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        filteredDistincts = distincts
        searchBar.text = ""
        searchBar.resignFirstResponder()
        reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredDistincts = distincts
            reloadData()
            return
        }
        let lowercasedSearchText = searchText.lowercased()
        let departmentFilter: (Department) -> Bool = {(department) -> Bool in
             return department.name.lowercased().contains(lowercasedSearchText) || department.evidenceNumber.lowercased().contains(lowercasedSearchText)
            }
        
        let filteredDistinctsTmp = distincts!.filter({ (distinct) -> Bool in
            return distinct.departments.contains(where: departmentFilter)
        })
        filteredDistincts = filteredDistinctsTmp.map({ (distinct) -> District in
            let filteredDepartments = distinct.departments.filter(departmentFilter)
            return District(name: distinct.name, president: distinct.president, address: distinct.address, departments: filteredDepartments)
        })
        reloadData()
    }
    
    private func reloadData() -> Void {
        tableView.reloadData()
    }
}

extension DepartmentViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return filteredDistincts!.isEmpty ? 1 : filteredDistincts!.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredDistincts!.isEmpty ? 1 : filteredDistincts![section].departments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (filteredDistincts!.isEmpty) {
            let cell: DepartmentEmptyTableViewCell = tableView.dequeueReusableCell(withIdentifier: DepartmentEmptyTableViewCell.className, for: indexPath) as! DepartmentEmptyTableViewCell
            cell.type = DepartmentEmptyTableViewCellType.noDepartmemtsFilterResult
            return cell
        } else {
            let cell: DepartmentTableViewCell = tableView.dequeueReusableCell(withIdentifier: DepartmentTableViewCell.className, for: indexPath) as! DepartmentTableViewCell
            cell.loadFromData(filteredDistincts![indexPath.section].departments[indexPath.row])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return filteredDistincts!.isEmpty ? nil : filteredDistincts![section].name
    }
}
