import UIKit

class BaseScreenViewController: UIViewController {
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint?
    @IBOutlet weak var viewContainer: UIView?
    
    let loaderScreen: LoaderMaskView = LoaderMaskView()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        self.title = getTitle()
        loadScreenData();
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if let containerFrame: CGRect = viewContainer?.frame {
            loaderScreen.frame = CGRect(x: 0, y: 0, width: containerFrame.width, height: containerFrame.height)
        }
    }
    
    func loadScreenData() -> Void {
        // override
    }
    
    func getTitle() -> String? {
        return ""
    }
    
    
}

extension BaseScreenViewController: LoaderMaskViewProtocol {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewContainer?.addSubview(loaderScreen)
        loaderScreen.delegate = self
        loaderScreen.hide()
    }
    
    func onRefresh() {
        loadScreenData()
    }
    
}

extension BaseScreenViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: .UIKeyboardWillHide, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillHide, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardRect: CGRect = notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? CGRect,
            let duration: Double = notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? Double {
            
            UIView.animate(withDuration: duration) {
                self.bottomConstraint?.constant = keyboardRect.height
                self.view.layoutIfNeeded()
            };
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        if let duration: Double = notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? Double {
            UIView.animate(withDuration: duration) {
                self.bottomConstraint?.constant = 0
                self.view.layoutIfNeeded()
            };
        }
    }
}
