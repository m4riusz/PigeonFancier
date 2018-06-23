import UIKit

class PigeonViewController: BasePigeonViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loaderScreen.error()
    }

    override func loadScreenData() {
        super.loadScreenData()
        NSLog("PigeonViewController - load screen data")
    }
}
