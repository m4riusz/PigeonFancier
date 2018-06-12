import UIKit

class BaseAboutNavigationViewController: BaseNavigationViewController {

    override func initWithAppociatedController() -> BaseAboutNavigationViewController {
        return BaseAboutNavigationViewController(rootViewController: AboutViewController())
    }
}
