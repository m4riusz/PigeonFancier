import UIKit

struct DepartmentDetailHeaderTableViewCellData {
    let evidenceNumber: String
    let departmentName: String
    var favourite: Bool
}

class DepartmentDetailHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var evidenceNumberLabel: Label!
    @IBOutlet weak var departmentNameLabel: Label!
    @IBOutlet weak var favouriteButton: Button!
    var data: DepartmentDetailHeaderTableViewCellData?;
    
    override func awakeFromNib() {
        super.awakeFromNib()
        evidenceNumberLabel.labelStyle = .bodyBold(100.0, 20.0)
        departmentNameLabel.labelStyle = .capitionBold(40.0, 20.0)
    }
    
    override func prepareForReuse() {
        accessoryView = nil
    }
}

extension DepartmentDetailHeaderTableViewCell: DataSourceLoading {
    
    func loadFromData(_ data: Any) {
        if let castedData = data as? DepartmentDetailHeaderTableViewCellData {
            self.data = castedData
            evidenceNumberLabel.text = self.data?.evidenceNumber
            departmentNameLabel.text = self.data?.departmentName
        }
    }
}
