import UIKit

class BaseNavigationViewController: UINavigationController {
    
    func initWithAppociatedController() -> BaseNavigationViewController {
        return BaseNavigationViewController(rootViewController: BaseScreenViewController())
    }
    
}
