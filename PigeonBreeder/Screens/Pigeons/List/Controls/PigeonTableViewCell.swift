import UIKit

class PigeonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var pigeonImageView: UIImageView!
    @IBOutlet weak var departmentNumberLabel: Label!
    
    @IBOutlet weak var countryCodeLabel: Label!
    @IBOutlet weak var yearLabel: Label!
    @IBOutlet weak var yearColorView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        departmentNumberLabel.labelStyle = .bodyBold(16.0, 5.0)
        countryCodeLabel.labelStyle = .bodyBold(20.0, 5.0)
        yearLabel.labelStyle = .capitionBold(14.0, 5.0)
    }
    
}
