import UIKit

class DepartmentTableViewCell: UITableViewCell, DataSourceLoading {
    @IBOutlet weak var departmentNumberLabel: Label!
    @IBOutlet weak var departmentNameLabel: Label!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        departmentNumberLabel.labelStyle = .bodyBold14_20
        departmentNameLabel.labelStyle = .body14_20
    }

    func loadFromData(_ data: Any) {
        guard data is Department && departmentNameLabel != nil else {
            return
        }
        let department = data as! Department
        departmentNumberLabel.text = department.evidenceNumber
        departmentNameLabel.text = department.name
    }

}

