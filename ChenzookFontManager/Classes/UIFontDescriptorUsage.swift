//  Created by Seyed Mojtaba Hosseini Zeidabadi.
//  Copyright © 2018 Chenzook. All rights reserved.
//
//  Linkedin: https://linkedin.com/in/MojtabaHosseini
//  GitHub: https://github.com/MojtabaHs
//  Web: https://chenzook.com
//
//  License: MIT License
//

import Foundation

public enum UIFontDescriptorUsage: String {
    
    case ultraLight = "CTFontUltraLightUsage"
    case thin       = "CTFontThinUsage"
    case light      = "CTFontLightUsage"
    case regular    = "CTFontRegularUsage"
    case oblique    = "CTFontObliqueUsage"
    case medium     = "CTFontMediumUsage"
    case demi       = "CTFontDemiUsage"
    case emphasized = "CTFontEmphasizedUsage"
    case bold       = "CTFontBoldUsage"
    case heavy      = "CTFontHeavyUsage"
    case black      = "CTFontBlackUsage"
    
}

public extension UIFontDescriptor.AttributeName {
    static let usage = UIFontDescriptor.AttributeName("NSCTFontUIUsageAttribute")
}
