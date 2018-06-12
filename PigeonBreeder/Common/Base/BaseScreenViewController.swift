import UIKit

class BaseScreenViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        loadScreenData();
    }
    
    func loadScreenData() -> Void {
        // override
    }
    
}
