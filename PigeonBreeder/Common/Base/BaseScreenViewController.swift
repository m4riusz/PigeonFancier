import UIKit

class BaseScreenViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        self.title = getTitle()
        loadScreenData();
    }
    
    func loadScreenData() -> Void {
        // override
    }
    
    func getTitle() -> String? {
        return ""
    }
    
}
