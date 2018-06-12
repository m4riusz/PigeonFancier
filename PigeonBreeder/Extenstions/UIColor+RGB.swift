import UIKit

extension UIColor {
    
    func colorWithRGB(red: UInt8, green: UInt8, blue: UInt8) -> UIColor {
        return colorWithRGBA(red: red, green: green, blue: blue, alpha: 255)
    }
    
    func colorWithRGBA(red: UInt8, green: UInt8, blue: UInt8, alpha: UInt8) -> UIColor {
        return UIColor(red: CGFloat(red) / CGFloat(255), green: CGFloat(green) / CGFloat(255), blue: CGFloat(blue) / CGFloat(255), alpha: CGFloat(alpha / 255))
    }
}
