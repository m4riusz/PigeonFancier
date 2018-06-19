import UIKit

enum DepartmentEmptyTableViewCellType {
    case none
    case noDepartmemtsFilterResult
}

class DepartmentEmptyTableViewCell: UITableViewCell {

    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var titleLabel: Label!
    @IBOutlet weak var descriptionLabel: Label!
    
    var type: DepartmentEmptyTableViewCellType = .none {
        didSet {
            setupForType(type)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.labelStyle = .bodyBold(16.0, 20.0)
        descriptionLabel.labelStyle = .capition(14.0, 5.0)
    }
    
    fileprivate func setupForType(_ type: DepartmentEmptyTableViewCellType) {
        var image, title, description: String
        
        switch type {
        case .none:
            image = LocalizableStrings.empty.localized
            title = LocalizableStrings.empty.localized
            description = LocalizableStrings.empty.localized
            break;
        case .noDepartmemtsFilterResult:
            image = "ic_empty_filter_result"
            title = LocalizableStrings.departmentsNotFound.localized
            description = LocalizableStrings.departmentsNotFoundFilter.localized
            break;
        }
        
        cellImageView.image = UIImage(named: image)
        titleLabel.text = title
        descriptionLabel.text = description
    }
    
}
