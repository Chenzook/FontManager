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

public typealias CS = ChenzookSwizzler

public class ChenzookSwizzler {
    
    public class func exchange(classMethod orginalMethod: Selector, of originalClass: AnyClass?, with customMethod: Selector, of customClass: AnyClass?) {
        
        guard let originalMethod = class_getClassMethod(originalClass, orginalMethod) else {
            return assertionFailure("Original class method not found")
        }
        
        guard let customMethod = class_getClassMethod(customClass, customMethod) else {
            return assertionFailure("Custom class method not found")
        }
        
        method_exchangeImplementations(originalMethod, customMethod)
    }
    
     public class func exchange(instanceMethod orginalMethod: Selector, of originalClass: AnyClass?, with customMethod: Selector, of customClass: AnyClass?) {

        guard let originalMethod = class_getInstanceMethod(originalClass, orginalMethod) else {
            return assertionFailure("Original instance method not found")
        }
        
        guard let customMethod = class_getInstanceMethod(customClass, customMethod) else {
            return assertionFailure("Custom instance method not found")
        }
        
        method_exchangeImplementations(originalMethod, customMethod)
    }
    
}
