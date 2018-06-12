import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let rootController = MainTabBarViewController()
        
        let aboutNavigationController = BaseAboutNavigationViewController().initWithAppociatedController()
        let pigeonNavigationController = BasePigeonNavigationViewController().initWithAppociatedController()
        let departmentNavigationController = BaseDepartmentNavigatationViewController().initWithAppociatedController()
        
        aboutNavigationController.tabBarItem = UITabBarItem(title: "About", image: UIImage(named: "ic_info_outline"), selectedImage: UIImage(named: "ic_info"))
        
        pigeonNavigationController.tabBarItem = UITabBarItem(title: "Pigeon", image: UIImage(named: "ic_info_outline"), selectedImage: UIImage(named: "ic_info"))
        
        departmentNavigationController.tabBarItem = UITabBarItem(title: "Department", image: UIImage(named: "ic_info_outline"), selectedImage: UIImage(named: "ic_info"))
        
        rootController.setViewControllers([pigeonNavigationController, departmentNavigationController, aboutNavigationController], animated: true)
        window?.rootViewController = rootController
        window?.makeKeyAndVisible()
        return true
    }

}

