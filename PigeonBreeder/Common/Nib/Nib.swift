import UIKit

class NibView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadView()
    }
    
    func loadView() {
        if let view: UIView = Bundle.main.loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?.first as? UIView {
            self.addSubview(view)
            view.frame = self.frame
            view.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            view.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
            view.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            commonInit()
        }
    }
    
    func commonInit() -> Void {
        // override
    }
}
