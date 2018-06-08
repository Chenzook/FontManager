//  Created by Seyed Mojtaba Hosseini Zeidabadi.
//  Copyright © 2018 Chenzook. All rights reserved.
//
//  Linkedin: https://linkedin.com/in/MojtabaHosseini
//  GitHub: https://github.com/MojtabaHs
//  Web: https://chenzook.com
//
//  License: MIT License
//

import UIKit.UIFont

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
        exchangeOriginalUIFontMethodsWithCustomMethods()
    }
    
    public static func overrideSystemFont(fontName: String, increasedBy offset: CGFloat = 0) {
        overrideSystemFont(fontFamily: FontFamily(regular: fontName), increasedBy: offset)
    }
    
    private class func customFont(name: String, size: CGFloat) -> UIFont {
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

@objc private extension ChenzookFontManager {
    
    class func customSystemFont(ofSize size: CGFloat) -> UIFont {
        return customFont(name: CFM.fontFamily.regular, size: size)
    }
    
    class func customBoldSystemFont(ofSize size: CGFloat) -> UIFont {
        return customFont(name: CFM.fontFamily.bold, size: size)
    }
    
    class func customSystemFont(ofSize size: CGFloat, weight: UIFont.Weight) -> UIFont {
        switch weight {
            
        case .ultraLight: return customFont(name: CFM.fontFamily.ultraLight, size: size)
        case .thin:       return customFont(name: CFM.fontFamily.thin,       size: size)
        case .light:      return customFont(name: CFM.fontFamily.light,      size: size)
        case .regular:    return customFont(name: CFM.fontFamily.regular,    size: size)
        case .medium:     return customFont(name: CFM.fontFamily.medium,     size: size)
        case .semibold:   return customFont(name: CFM.fontFamily.semibold,   size: size)
        case .bold:       return customFont(name: CFM.fontFamily.bold,       size: size)
        case .heavy:      return customFont(name: CFM.fontFamily.heavy,      size: size)
        case .black:      return customFont(name: CFM.fontFamily.black,      size: size)
            
        default:          return customFont(name: CFM.fontFamily.regular,    size: size)
        }
    }
    
    class func customItalicSystemFont(ofSize size: CGFloat) -> UIFont {
        return customFont(name: CFM.fontFamily.oblique, size: size)
    }
    
}

private extension ChenzookFontManager {
    
    class func exchangeOriginalUIFontMethodsWithCustomMethods() {
        
        Swizzler.exchange(
            classMethod: #selector(UIFont.systemFont(ofSize:)), of: UIFont.self,
            with: #selector(CFM.customSystemFont(ofSize:)), of: CFM.self
        )
        
        Swizzler.exchange(
            classMethod: #selector(UIFont.boldSystemFont(ofSize:)), of: UIFont.self,
            with: #selector(CFM.customBoldSystemFont(ofSize:)), of: CFM.self
        )
        
        Swizzler.exchange(
            classMethod: #selector(UIFont.systemFont(ofSize:weight:)), of: UIFont.self,
            with: #selector(CFM.customSystemFont(ofSize:weight:)), of: CFM.self
        )
        
        Swizzler.exchange(
            classMethod: #selector(UIFont.italicSystemFont(ofSize:)), of: UIFont.self,
            with: #selector(CFM.customItalicSystemFont(ofSize:)), of: CFM.self
        )
        
        Swizzler.exchange(instanceMethod: #selector(UIFontDescriptor.init(coder:)), of: UIFont.self, with: #selector(UIFont.init(customCoder:)), of: UIFont.self)
    }
    
}

private extension UIFont {
    @objc convenience init(customCoder aDecoder: NSCoder) {
        guard let fontDescriptor = aDecoder.decodeObject(forKey: "UIFontDescriptor") as? UIFontDescriptor else {
            self.init(customCoder: aDecoder)
            return
        }
        
        guard let fontUIUsageAttribute = fontDescriptor.fontAttributes[.usage] as? String else {
            self.init(customCoder: aDecoder)
            return
        }

        var fontFamily: FontFamily {
            return CFM.fontFamily
        }

        var fontName: String {
            
            guard let fontDescriptorUsage = UIFontDescriptorUsage(rawValue: fontUIUsageAttribute) else {
                print("Undefined usage attribute: \(fontUIUsageAttribute)")
                return fontFamily.regular
            }
            
            switch fontDescriptorUsage {
            case .ultraLight: return fontFamily.ultraLight
            case .thin:       return fontFamily.thin
            case .light:      return fontFamily.light
            case .regular:    return fontFamily.regular
            case .oblique:    return fontFamily.oblique
            case .medium:     return fontFamily.medium
            case .demi:       return fontFamily.semibold
            case .emphasized: return fontFamily.emphasized
            case .bold:       return fontFamily.bold
            case .heavy:      return fontFamily.heavy
            case .black:      return fontFamily.black
            }
        }

        self.init(name: fontName, size: fontDescriptor.pointSize + CFM.offset)!
    }
}
