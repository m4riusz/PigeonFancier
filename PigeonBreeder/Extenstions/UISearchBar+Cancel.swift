import UIKit

extension UISearchBar {
    
    func setCancelButtonTitle(_ title: String) -> Void {
        self.setValue(title, forKey: "_cancelButtonText")
    }
    
}
