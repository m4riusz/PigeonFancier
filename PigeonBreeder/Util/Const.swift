import UIKit

struct Config {
    
    struct Color {
        static let orange = UIColor().colorWithRGB(red: 244, green: 155, blue: 66)
        static let orangeDark = UIColor().colorWithRGB(red: 206, green: 139, blue: 66)
        static let white = UIColor.white
        static let black = UIColor.black
        static let warning = UIColor.yellow
        static let error = UIColor.red
        static let blue = UIColor().colorWithRGB(red: 124, green: 180, blue: 255)
        static let blueDark = UIColor().colorWithRGB(red: 100, green: 156, blue: 255)
        static let gray = UIColor.gray
    }
    
    struct Font {
        static let normal = UIFont(name: "Courier", size: 14)
        static let bold = UIFont(name: "Courier-Bold", size: 14)
    }
}
