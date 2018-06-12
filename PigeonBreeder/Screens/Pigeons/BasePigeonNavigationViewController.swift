import UIKit

class BasePigeonNavigationViewController: BaseNavigationViewController {

    override func initWithAppociatedController() -> BasePigeonNavigationViewController {
        return BasePigeonNavigationViewController(rootViewController: PigeonViewController())
    }

}
