import UIKit

class DepartmentDetailHeaderTableViewCell: UITableViewCell, DataSourceLoading {

    @IBOutlet weak var evidenceNumberLabel: Label!
    @IBOutlet weak var departmentNameLabel: Label!
    @IBOutlet weak var disctinctNameLabel: Label!
    @IBOutlet weak var favouriteButton: Button!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        evidenceNumberLabel.labelStyle = .body(40.0, 20)
        departmentNameLabel.labelStyle = .capitionBold(20.0, 20.0)
        disctinctNameLabel.labelStyle = .capition(16.0, 20)
    }
    
    func loadFromData(_ data: Any) {
        
    }
    
}
