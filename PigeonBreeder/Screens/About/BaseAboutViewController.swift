import UIKit

class BaseAboutViewController: BaseScreenViewController {

    override func getTitle() -> String? {
        return LocalizableStrings.navAbout.localized
    }
}
