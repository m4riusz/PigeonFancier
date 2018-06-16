import UIKit

enum LabelStyle {
    case none
    case capition(CGFloat, CGFloat)
    case capitionBold(CGFloat, CGFloat)
    case body(CGFloat, CGFloat)
    case bodyBold(CGFloat, CGFloat)
}

class Label: UILabel {
    
    var labelStyle: LabelStyle = .none {
        didSet {
            setupForStyle(labelStyle)
        }
    }
    
    override var text: String? {
        didSet {
            setupForStyle(labelStyle)
        }
    }
    
    private func setupForStyle(_ style: LabelStyle) -> Void {
        setupFontForStyle(style)
    }
    
    private func setupFontForStyle(_ style: LabelStyle) -> Void {
        let font: UIFont
        let fontParagraph: NSMutableParagraphStyle = NSMutableParagraphStyle()
        fontParagraph.alignment = textAlignment
        let color: UIColor
        
        switch style {
        case .none:
            return
        case let .capition(size, paragraph):
            font = Config.Font.normal!.withSize(size)
            fontParagraph.lineSpacing = paragraph
            color = Config.Color.gray
            break
        case let .capitionBold(size, paragraph):
            font = Config.Font.bold!.withSize(size)
            fontParagraph.lineSpacing = paragraph
            color = Config.Color.gray
            break
        case let .body(size, paragraph):
            font = Config.Font.normal!.withSize(size)
            fontParagraph.lineSpacing = paragraph
            color = Config.Color.black
            break
        case let .bodyBold(size, paragraph):
            font = Config.Font.bold!.withSize(size)
            fontParagraph.lineSpacing = paragraph
            color = Config.Color.black
            break
        }
     
        let mutableAttributedString = NSMutableAttributedString(string: text ?? "")
        let allTextRange: NSRange = NSMakeRange(0, (text?.count)!)
        mutableAttributedString.addAttribute(NSAttributedStringKey.paragraphStyle, value: fontParagraph, range: allTextRange)
        mutableAttributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: color, range: allTextRange)
        mutableAttributedString.addAttribute(NSAttributedStringKey.font, value: font, range: allTextRange)
        attributedText = mutableAttributedString
        
    }
}

