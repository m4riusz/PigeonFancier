import Foundation

extension NSObject {
    var className: String {
        return String(describing: self)
    }
}
