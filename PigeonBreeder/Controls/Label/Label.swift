import UIKit

enum LabelStyle {
    case none
    case capition8_20
    case capitionBold8_20
    case body14_20
    case bodyBold14_20
}

class Label: UILabel {
    
    var labelStyle: LabelStyle = .none {
        didSet {
            setupForStyle(labelStyle)
        }
    }
    var params: [String : Any] = [:]
    
    override var text: String? {
        didSet {
            updateStyleForText()
        }
    }
    
    private func setupForStyle(_ style: LabelStyle) -> Void {
        if (style == .none) {
            return
        }
        params = [:]
        setupFontForStyle(style)
        setupTextColorForStyle(style)
        setupLineSpacingForStyle(style)
        updateStyleForText()
    }
    
    private func setupFontForStyle(_ style: LabelStyle) -> Void {
        let font: UIFont
        switch style {
        case .capition8_20, .body14_20:
            font = Config.Font.normal!
            break
        case .capitionBold8_20, .bodyBold14_20:
            font = Config.Font.bold!
            break
        default:
            font = Config.Font.normal!
        }
        params["font"] = font
    }
    
    private func setupLineSpacingForStyle(_ style: LabelStyle) -> Void {
        let paragraph: NSMutableParagraphStyle = NSMutableParagraphStyle()
        switch style {
        case .capition8_20, .capitionBold8_20, .body14_20, .bodyBold14_20:
            paragraph.lineSpacing = 20
        default:
            paragraph.lineSpacing = 20
        }
        params["paragraph"] = paragraph
    }
    
    private func setupTextColorForStyle(_ style: LabelStyle) -> Void {
        
        let color: UIColor
        switch style {
        case .capition8_20, .capitionBold8_20:
            color = Config.Color.gray
        default:
            color = UIColor.darkGray
        }
        params["color"] = color
    }
    
    private func updateStyleForText() -> Void {
        if (labelStyle == .none) {
            return
        }
        let mutableAttributedString = NSMutableAttributedString(string: text ?? "")
        let allTextRange: NSRange = NSMakeRange(0, (text?.count)!)
        mutableAttributedString.addAttribute(NSAttributedStringKey.paragraphStyle, value: params["paragraph"]!, range: allTextRange)
        mutableAttributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: params["color"]!, range: allTextRange)
        mutableAttributedString.addAttribute(NSAttributedStringKey.font, value: params["font"]!, range: allTextRange)
        attributedText = mutableAttributedString
    }
}

