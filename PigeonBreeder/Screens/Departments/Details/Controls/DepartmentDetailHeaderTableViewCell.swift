import UIKit

class DepartmentDetailHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var evidenceNumberLabel: Label!
    @IBOutlet weak var departmentNameLabel: Label!
    @IBOutlet weak var favouriteButton: Button!
    
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
        if let castedData = data as? [String : String] {
            evidenceNumberLabel.text = castedData["EvidenceNumber"]
            departmentNameLabel.text = castedData["Name"]
        }
    }
}
