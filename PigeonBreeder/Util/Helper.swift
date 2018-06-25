import Foundation
import UIKit

class AppHelper {
    
    static func callNumber(_ phoneNumber:String, withSuccessBlock successBlock:(() -> Void)? = nil, withErrorBlock errorBlock:(() -> Void)? = nil ) -> Void {
        
        if let phoneCallURL: URL = URL(string:"tel://\(phoneNumber)") {
            let application: UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL)) {
                application.open(phoneCallURL, options: [:], completionHandler: { (result) in
                    result ? successBlock?() : errorBlock?()
                })
            } else {
                errorBlock?()
            }
        }
    }
    
    static func mailTo(_ email:String, withSuccessBlock successBlock:(() -> Void)? = nil, withErrorBlock errorBlock:(() -> Void)? = nil ) -> Void {
        
        if let url = URL(string: "mailto://\(email)") {
            let application: UIApplication = UIApplication.shared
            if (application.canOpenURL(url)) {
                application.open(url, options: [:], completionHandler: { (result) in
                    result ? successBlock?() : errorBlock?()
                })
            } else {
                errorBlock?()
            }
        }
    }
    
    
    
    static func navigateToAddress(_ address: String, withSuccessBlock successBlock:(() -> Void)? = nil, withErrorBlock errorBlock:(() -> Void)? = nil ) -> Void {
        
        let baseUrl: String = "http://maps.apple.com/?q="
        let encodedName = address.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        if let url = URL(string: "\(baseUrl)\(encodedName)") {
            let application: UIApplication = UIApplication.shared
            if (application.canOpenURL(url)) {
                application.open(url, options: [:], completionHandler: { (result) in
                    result ? successBlock?() : errorBlock?()
                })
            } else {
                errorBlock?()
            }
        }
    }
    
}
