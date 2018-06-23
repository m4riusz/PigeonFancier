import UIKit


enum ButtonStyle: Int {
    case none
    case orangeLink
    case orangeFlat
    case orangeRised
}

@IBDesignable
class Button: UIButton {
    
    private var backgroundColors: [UIColor] = [UIColor.clear, UIColor.clear, UIColor.clear]
    
    var buttonStyle: ButtonStyle = .none {
        didSet {
            setupWithStyle(buttonStyle)
        }
    }
    
    var title: String? {
        didSet {
            setTitle(title, for: .normal)
            setTitle(title, for: .selected)
            setTitle(title, for: .highlighted)
            updateState()
        }
    }
    
    private func setupWithStyle(_ buttonStyle: ButtonStyle) -> Void {
        if (buttonStyle == .none) {
            return
        }
        setupTitleInsetsForStyle(buttonStyle)
        setupTitleColorForStyle(buttonStyle)
        setupBackgroundForStyle(buttonStyle)
        setupFontFor(style: buttonStyle)
        updateState()
    }
    
    private func setupTitleInsetsForStyle(_ style: ButtonStyle ) -> Void {
        self.titleEdgeInsets = UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8)
    }
    
    private func setupBackgroundForStyle(_ style: ButtonStyle) -> Void {
        let normal: UIColor, highlited: UIColor, disabled: UIColor
        
        switch style {
        case .orangeLink:
            normal = UIColor.clear
            highlited = UIColor.clear
            disabled = UIColor.clear
            break
        case .orangeFlat:
            normal = UIColor.clear
            highlited = Config.Color.orange
            disabled = Config.Color.gray
            break
        case .orangeRised:
            normal = Config.Color.orange
            highlited = Config.Color.orangeDark
            disabled = Config.Color.gray
            break
        default:
            normal = UIColor.clear
            highlited = UIColor.clear
            disabled = Config.Color.gray
            break
        }
        backgroundColors = [normal, highlited, disabled]
    }
    
    private func setupTitleColorForStyle(_ style: ButtonStyle) -> Void {
        let normal: UIColor, highlited: UIColor, disabled: UIColor
        
        switch style {
        case .orangeLink:
            normal = Config.Color.orange
            highlited = Config.Color.orangeDark
            disabled = Config.Color.gray
            break
        case .orangeFlat:
            normal = Config.Color.orange
            highlited = Config.Color.white
            disabled = Config.Color.white
            break
        case .orangeRised:
            normal = Config.Color.white
            highlited = Config.Color.white
            disabled =  Config.Color.white
            break
        default:
            normal = Config.Color.white
            highlited = Config.Color.white
            disabled = Config.Color.gray
            break
        }
        setTitleColor(normal, for: .normal)
        setTitleColor(highlited, for: .highlighted)
        setTitleColor(disabled, for: .disabled)
    }
    
    private func setupFontFor(style: ButtonStyle) -> Void {
        titleLabel?.font = Config.Font.normal
    }
    
    override var isEnabled: Bool {
        didSet {
            updateState()
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            updateState()
        }
    }
    
    private func updateState() -> Void {
        if (!isEnabled) {
            self.backgroundColor = backgroundColors[2]
        } else if (isHighlighted) {
            self.backgroundColor = backgroundColors[1]
        } else {
            self.backgroundColor = backgroundColors[0]
        }
    }
    
    override func prepareForInterfaceBuilder() {
        setupWithStyle(.orangeRised)
    }
    
}
