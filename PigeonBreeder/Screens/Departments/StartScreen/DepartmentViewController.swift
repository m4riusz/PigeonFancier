import UIKit

class DepartmentViewController: BaseDepartmentViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var departments: [Department]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: DepartmentTableViewCell.className, bundle: nil), forCellReuseIdentifier: DepartmentTableViewCell.className)
        
        departments = [
                Department(favourite: false, evidenceNumber: "0280", name: "Kutno", ownerFirstName: "Tomasz", ownerLastName: "Ogrodowski", ownerStreet: "Pojezierska 42", ownerCity: "Kutno", ownerPostalCode: "99-123", ownerPhoneNumber: nil),
                Department(favourite: false, evidenceNumber: "0282", name: "Łódź", ownerFirstName: "Dawid", ownerLastName: "Makowski", ownerStreet: "Bielawska 2", ownerCity: "Łódź", ownerPostalCode: "90-210", ownerPhoneNumber: ["222-111-111"]),
                Department(favourite: false, evidenceNumber: "02", name: "Kutno", ownerFirstName: "Tomasz", ownerLastName: "Ogrodowski", ownerStreet: "Pojezierska 42", ownerCity: "Kutno", ownerPostalCode: "99-123", ownerPhoneNumber: nil),
                Department(favourite: false, evidenceNumber: "0380", name: "Kutno", ownerFirstName: "Tomasz", ownerLastName: "Ogrodowski", ownerStreet: "Pojezierska 42", ownerCity: "Kutno", ownerPostalCode: "99-123", ownerPhoneNumber: nil),
                Department(favourite: false, evidenceNumber: "018", name: "Kutno", ownerFirstName: "Tomasz", ownerLastName: "Ogrodowski", ownerStreet: "Pojezierska 42", ownerCity: "Kutno", ownerPostalCode: "99-123", ownerPhoneNumber: nil)
        ]
    }
}

extension DepartmentViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return departments!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: DepartmentTableViewCell = tableView.dequeueReusableCell(withIdentifier: DepartmentTableViewCell.className, for: indexPath) as! DepartmentTableViewCell
        cell.loadFromData(departments![indexPath.row])
        return cell;
    }
}
