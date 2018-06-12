import UIKit

class BaseDepartmentNavigatationViewController: BaseNavigationViewController {

    override func initWithAppociatedController() -> BaseDepartmentNavigatationViewController {
        return BaseDepartmentNavigatationViewController(rootViewController: DepartmentViewController())
    }
    
}
