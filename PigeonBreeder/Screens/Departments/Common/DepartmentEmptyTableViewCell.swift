import UIKit

enum DepartmentEmptyTableViewCellType {
    case none
    case noDepartments
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
        descriptionLabel.labelStyle = .capition(14.0, 20.0)
    }
    
    fileprivate func setupForType(_ type: DepartmentEmptyTableViewCellType) {
        var image, title, description: String
        
        switch type {
        case .none:
            image = ""
            title = ""
            description = ""
            break;
        case .noDepartments:
            image = "ic_sad_face"
            title = "Brak oddziałów"
            description = "Oddziały aktualnie nie dostępne"
            break;
        case .noDepartmemtsFilterResult:
            image = "ic_empty_filter_result"
            title = "Nie znaleziono oddziałów"
            description = "Nie odnaleziono oddziałów pasujących do podanej frazy"
            break;
        }
        
        cellImageView.image = UIImage(named: image)
        titleLabel.text = title
        descriptionLabel.text = description
    }
    
}
