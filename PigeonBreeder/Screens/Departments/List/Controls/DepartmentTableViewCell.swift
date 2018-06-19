import UIKit

class DepartmentTableViewCell: UITableViewCell, DataSourceLoading {
    @IBOutlet weak var departmentNumberLabel: Label!
    @IBOutlet weak var departmentNameLabel: Label!
    
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
        departmentNumberLabel.text = department.evidenceNumber
        departmentNameLabel.text = department.name
    }

}

