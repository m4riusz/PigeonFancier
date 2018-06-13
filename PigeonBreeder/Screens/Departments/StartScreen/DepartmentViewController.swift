import UIKit

class DepartmentViewController: BaseDepartmentViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var departments: [Department]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(DepartmentTableViewCell, forCellReuseIdentifier: DepartmentTableViewCell.)
        
        departments = [
                Department(favourite: false, evidenceNumber: "0280", name: "Kutno", ownerFirstName: "Tomasz", ownerLastName: "Ogrodowski", ownerStreet: "Pojezierska 42", ownerCity: "Kutno", ownerPostalCode: "99-123", ownerPhoneNumber: nil),
                Department(favourite: false, evidenceNumber: "0282", name: "Łódź", ownerFirstName: "Dawid", ownerLastName: "Makowski", ownerStreet: "Bielawska 2", ownerCity: "Łódź", ownerPostalCode: "90-210", ownerPhoneNumber: ["222-111-111"]),
                Department(favourite: false, evidenceNumber: "02", name: "Kutno", ownerFirstName: "Tomasz", ownerLastName: "Ogrodowski", ownerStreet: "Pojezierska 42", ownerCity: "Kutno", ownerPostalCode: "99-123", ownerPhoneNumber: nil),
                Department(favourite: false, evidenceNumber: "0380", name: "Kutno", ownerFirstName: "Tomasz", ownerLastName: "Ogrodowski", ownerStreet: "Pojezierska 42", ownerCity: "Kutno", ownerPostalCode: "99-123", ownerPhoneNumber: nil),
                Department(favourite: false, evidenceNumber: "018", name: "Kutno", ownerFirstName: "Tomasz", ownerLastName: "Ogrodowski", ownerStreet: "Pojezierska 42", ownerCity: "Kutno", ownerPostalCode: "99-123", ownerPhoneNumber: nil)
        ]
    }
}
