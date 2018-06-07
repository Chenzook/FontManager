//  Created by Seyed Mojtaba Hosseini Zeidabadi.
//  Copyright © 2018 Chenzook. All rights reserved.
//
//  Linkedin: https://linkedin.com/in/MojtabaHosseini
//  GitHub: https://github.com/MojtabaHs
//  Web: https://chenzook.com
//
//  License: MIT License
//

import UIKit

/// Shortname
public typealias CFM = ChenzookFontManager

public class ChenzookFontManager {
    
    private init() {}
    
    /// Original font size will offset by this value. This can help to change application font size globaly without forcing user to use dynamic type.
    public private(set) static var offset: CGFloat = 0
    
    public private(set) static var fontFamily: FontFamily!
    
    public static func overrideSystemFont(fontFamily: FontFamily, increasedBy offset: CGFloat = 0) {
        self.fontFamily = fontFamily
        self.offset = offset
        UIFont.exchangeMethods()
    }
    
    public static func overrideSystemFont(fontName: String, increasedBy offset: CGFloat = 0) {
        overrideSystemFont(fontFamily: FontFamily(regular: fontName), increasedBy: offset)
    }
    
    fileprivate class func customFont(name: String, size: CGFloat) -> UIFont {
        let sizeWithOffset = size + offset
        guard let font = UIFont(name: name, size: sizeWithOffset) else {
            UIFont.familyNames.forEach({ familyName in
                let fontNames = UIFont.fontNames(forFamilyName: familyName)
                print(familyName, fontNames)
            })
            print("⭕️", name)
            fatalError("Font not found: \(name)")
        }
        return font
    }
}

@objc private extension UIFont {
    
    class func customSystemFont(ofSize size: CGFloat) -> UIFont {
        return CFM.customFont(name: CFM.fontFamily.regular, size: size)
    }
    
    class func customBoldSystemFont(ofSize size: CGFloat) -> UIFont {
        return CFM.customFont(name: CFM.fontFamily.bold, size: size)
    }
    
}

fileprivate extension UIFont {
    
    class func exchangeMethods() {
        
        exchange(classMethod: #selector(systemFont(ofSize:)),
                 with: #selector(customSystemFont(ofSize:)))
        
        exchange(classMethod: #selector(boldSystemFont(ofSize:)),
                 with: #selector(customBoldSystemFont(ofSize:)))
        
        exchange(instanceMethod: #selector(UIFontDescriptor.init(coder:)),
                 with: #selector(UIFont.init(customCoder:)))
    }
    
    private class func exchange(classMethod orginalMethod: Selector, with customMethod: Selector) {
        
        guard let systemFontMethod = class_getClassMethod(self, orginalMethod) else {
            return assertionFailure("Can't change system font")
        }
        
        guard let customSystemFontMethod = class_getClassMethod(self, customMethod) else {
            return assertionFailure("Can't change system font")
        }
        
        method_exchangeImplementations(systemFontMethod, customSystemFontMethod)
    }
    
    private class func exchange(instanceMethod orginalMethod: Selector, with customeMethod: Selector) {
        
        guard let systemFontMethod = class_getInstanceMethod(self, orginalMethod) else {
            return assertionFailure("Can't change system font")
        }
        
        guard let customSystemFontMethod = class_getInstanceMethod(self, customeMethod) else {
            return assertionFailure("Can't change system font")
        }
        
        method_exchangeImplementations(systemFontMethod, customSystemFontMethod)
    }
    
}

private extension UIFont {
    @objc convenience init(customCoder aDecoder: NSCoder) {
        guard let fontDescriptor = aDecoder.decodeObject(forKey: "UIFontDescriptor") as? UIFontDescriptor else {
            self.init(customCoder: aDecoder)
            return
        }
        
        guard let fontUIUsageAttribute = fontDescriptor.fontAttributes[.init(rawValue: "NSCTFontUIUsageAttribute")] as? String else {
            self.init(customCoder: aDecoder)
            return
        }
        var fontFamily: FontFamily {
            return CFM.fontFamily
        }
        var fontName: String {
            switch fontUIUsageAttribute {
            case "CTFontUltraLightUsage": return fontFamily.ultraLight
            case "CTFontThinUsage":       return fontFamily.thin
            case "CTFontLightUsage":      return fontFamily.light
            case "CTFontRegularUsage":    return fontFamily.regular
            case "CTFontMediumUsage":     return fontFamily.medium
            case "CTFontDemiUsage":       return fontFamily.semibold
            case "CTFontEmphasizedUsage": return fontFamily.bold
            case "CTFontBoldUsage":       return fontFamily.bold
            case "CTFontHeavyUsage":      return fontFamily.heavy
            case "CTFontBlackUsage":      return fontFamily.black
            case "CTFontObliqueUsage":    return fontFamily.oblique
            default:
                assertionFailure("Unhandled font attribute: \(fontUIUsageAttribute)")
                return fontFamily.regular
            }
        }
        self.init(name: fontName, size: fontDescriptor.pointSize + CFM.offset)!
    }
}
