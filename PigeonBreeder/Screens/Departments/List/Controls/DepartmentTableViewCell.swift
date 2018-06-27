import UIKit

class DepartmentTableViewCell: UITableViewCell, DataSourceLoading {
    @IBOutlet weak var departmentNumberLabel: Label!
    @IBOutlet weak var departmentNameLabel: Label!
    var data: Department?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        departmentNumberLabel.labelStyle = .bodyBold(16.0, 20.0)
        departmentNameLabel.labelStyle = .capition(16.0, 20.0)
    }

    func loadFromData(_ data: Any) {
        guard data is Department else {
            return
        }
        let department = data as! Department
        self.data = department
        departmentNumberLabel.text = department.evidenceNumber
        departmentNameLabel.text = department.name
    }

}

