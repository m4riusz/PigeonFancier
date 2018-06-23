import UIKit

enum EmptyMaskViewType {
    case none
    case noDepartments
    case noDepartmentsFilterResult
}

@IBDesignable
class EmptyMaskView: NibView {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: Label!
    @IBOutlet weak var descriptionLabel: Label!
    
    func setupForType(_ type: EmptyMaskViewType) -> Void {
        var image, title, description: String
        var imageColor: UIColor
        var titleStyle, descriptionStyle: LabelStyle
        
        switch type {
        case .none:
            image = LocalizableStrings.empty.localized
            title = LocalizableStrings.empty.localized
            description = LocalizableStrings.empty.localized
            imageColor = Config.Color.orange
            titleStyle = .bodyBold(14.0, 5)
            descriptionStyle = .capition(14.0, 5)
            break
        case .noDepartments:
            image = "ic_neutral_face"
            title = LocalizableStrings.departmentsNotAvailable.localized
            description = LocalizableStrings.tryAgainLater.localized
            imageColor = Config.Color.orange
            titleStyle = .bodyBold(16.0, 5)
            descriptionStyle = .capition(14.0, 5)
            break
        case .noDepartmentsFilterResult:
            image = "ic_empty_filter_result"
            title = LocalizableStrings.departmentsNotFound.localized
            description = LocalizableStrings.departmentsNotFoundFilter.localized
            imageColor = Config.Color.blue
            titleStyle = .bodyBold(16.0, 5)
            descriptionStyle = .capition(14.0, 5)
            break
        }
        imageView.image = UIImage(named: image)
        imageView.tintColor = imageColor
        titleLabel.text = title
        descriptionLabel.text = description
        titleLabel.labelStyle = titleStyle
        descriptionLabel.labelStyle = descriptionStyle
    }
    
    override func prepareForInterfaceBuilder() {
        setupForType(.noDepartments)
    }

}
