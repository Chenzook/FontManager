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

public class Swizzler {
    
    class func exchange(classMethod orginalMethod: Selector, of originalClass: AnyClass?, with customMethod: Selector, of customClass: AnyClass?) {
        
        guard let originalMethod = class_getClassMethod(originalClass, orginalMethod) else {
            return assertionFailure("Can't change system font")
        }
        
        guard let customMethod = class_getClassMethod(customClass, customMethod) else {
            return assertionFailure("Can't change system font")
        }
        
        method_exchangeImplementations(originalMethod, customMethod)
    }
    
    class func exchange(instanceMethod orginalMethod: Selector, of originalClass: AnyClass?, with customMethod: Selector, of customClass: AnyClass?) {

        guard let originalMethod = class_getInstanceMethod(originalClass, orginalMethod) else {
            return assertionFailure("Can't change system font")
        }
        
        guard let customMethod = class_getInstanceMethod(customClass, customMethod) else {
            return assertionFailure("Can't change system font")
        }
        
        method_exchangeImplementations(originalMethod, customMethod)
    }
    
}
