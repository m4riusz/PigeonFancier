import UIKit

enum EmptyMaskViewType {
    case none
    case noDepartments
}

@IBDesignable
class EmptyMaskView: NibView {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: Label!
    @IBOutlet weak var descriptionLabel: Label!
    
    func setupForType(_ type: EmptyMaskViewType) -> Void {
        var image, title, description: String
        var titleStyle, descriptionStyle: LabelStyle
        
        switch type {
        case .none:
            image = LocalizableStrings.empty.localized
            title = LocalizableStrings.empty.localized
            description = LocalizableStrings.empty.localized
            titleStyle = .bodyBold(14.0, 5)
            descriptionStyle = .capition(14.0, 5)
            break
        case .noDepartments:
            image = "ic_sad_face"
            title = LocalizableStrings.departmentsNotAvailable.localized
            description = LocalizableStrings.tryAgainLater.localized
            titleStyle = .bodyBold(16.0, 5)
            descriptionStyle = .capition(14.0, 5)
            break
        }
        imageView.image = UIImage(named: image)
        titleLabel.text = title
        descriptionLabel.text = description
        titleLabel.labelStyle = titleStyle
        descriptionLabel.labelStyle = descriptionStyle
    }

}
