import UIKit

class DepartmentViewController: BaseDepartmentViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var distincts: [District]?
    var filteredDistincts: [District]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: DepartmentTableViewCell.className, bundle: nil), forCellReuseIdentifier: DepartmentTableViewCell.className)
        
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
        
    }
}

extension DepartmentViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let lowercasedSearchText = searchText.lowercased()
        let filteredDistinctsTmp = distincts!.filter({ (distinct) -> Bool in
            return distinct.departments.contains(where: { (department) -> Bool in
                return department.name.lowercased().contains(lowercasedSearchText) || department.evidenceNumber.lowercased().contains(lowercasedSearchText)
            })
        })
        filteredDistincts = filteredDistinctsTmp.map({ (distinct) -> District in
            let filteredDepartments = distinct.departments.filter({ (department) -> Bool in
                return department.name.lowercased().contains(lowercasedSearchText) || department.evidenceNumber.lowercased().contains(lowercasedSearchText)
            })
            return District(name: distinct.name, president: distinct.president, address: distinct.address, departments: filteredDepartments)
        })
        tableView.reloadData()
    }
}

extension DepartmentViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return filteredDistincts!.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredDistincts![section].departments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: DepartmentTableViewCell = tableView.dequeueReusableCell(withIdentifier: DepartmentTableViewCell.className, for: indexPath) as! DepartmentTableViewCell
        cell.loadFromData(filteredDistincts![indexPath.section].departments[indexPath.row])
        return cell;
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return filteredDistincts![section].name
    }
}
