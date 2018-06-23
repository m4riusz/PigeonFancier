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
        
        aboutNavigationController.tabBarItem = UITabBarItem(title: LocalizableStrings.navAbout.localized, image: UIImage(named: "ic_info_outline"), selectedImage: UIImage(named: "ic_info"))
        
        pigeonNavigationController.tabBarItem = UITabBarItem(title: LocalizableStrings.navPigeons.localized, image: UIImage(named: "ic_pigeon"), selectedImage: UIImage(named: "ic_pigeon"))
        
        departmentNavigationController.tabBarItem = UITabBarItem(title: LocalizableStrings.navDepartments.localized, image: UIImage(named: "ic_department"), selectedImage: UIImage(named: "ic_department"))
        
        rootController.setViewControllers([pigeonNavigationController, departmentNavigationController, aboutNavigationController], animated: true)
        window?.rootViewController = rootController
        window?.makeKeyAndVisible()
        return true
    }

}

