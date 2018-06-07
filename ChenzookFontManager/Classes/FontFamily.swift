//  Created by Seyed Mojtaba Hosseini Zeidabadi.
//  Copyright © 2018 Chenzook. All rights reserved.
//
//  Linkedin: https://linkedin.com/in/MojtabaHosseini
//  GitHub: https://github.com/MojtabaHs
//  Web: https://chenzook.com
//
//  License: MIT License
//

public class FontFamily {
    
    private func mostSimilarFontName(regularName: String, usage: String) -> String? {
        for familyName in UIFont.familyNames {
            for fontName in UIFont.fontNames(forFamilyName: familyName) {
                guard fontName.lowercased() != regularName.lowercased() + "-" + usage.lowercased() else { return fontName }
                guard fontName.lowercased() != regularName.lowercased() + "_" + usage.lowercased() else { return fontName }
                guard fontName.lowercased() != regularName.lowercased() + " " + usage.lowercased() else { return fontName }
                guard fontName.lowercased() != regularName.lowercased() + usage.lowercased() else { return fontName }
            }
        }
        return nil
    }
    
    internal lazy var ultraLight: String = {
        return mostSimilarFontName(regularName: regular, usage: "UltraLight") ?? thin // ?? light ?? regular
    }()
    
    internal lazy var thin: String = {
        return mostSimilarFontName(regularName: regular, usage: "thin") ?? light // ?? regular
    }()
    
    internal lazy var light: String = {
        return mostSimilarFontName(regularName: regular, usage: "light") ?? regular
    }()
    
    internal let regular: String
    
    internal lazy var oblique: String = {
        return mostSimilarFontName(regularName: regular, usage: "Oblique") ?? regular
    }()
    
    internal lazy var medium: String = {
        return mostSimilarFontName(regularName: regular, usage: "medium") ?? regular
    }()
    
    internal lazy var semibold: String = {
        return mostSimilarFontName(regularName: regular, usage: "semibold") ?? medium // ?? regular
    }()
    
    internal lazy var bold: String = {
        return mostSimilarFontName(regularName: regular, usage: "bold") ?? semibold // ?? medium ?? regular
    }()
    
    internal lazy var emphasized: String = {
        return mostSimilarFontName(regularName: regular, usage: "emphasized") ?? bold // ?? medium ?? regular
    }()
    
    internal lazy var heavy: String = {
        return mostSimilarFontName(regularName: regular, usage: "heavy") ?? bold // ?? semibold ?? medium ?? regular
    }()
    
    internal lazy var black: String = {
        return mostSimilarFontName(regularName: regular, usage: "black") ?? heavy // ?? bold ?? semibold ?? medium ?? regular
    }()
    
    public init(regular: String,
                ultraLight: String? = nil,
                thin: String? = nil,
                light: String? = nil,
                oblique: String? = nil,
                medium: String? = nil,
                semibold: String? = nil,
                bold: String? = nil,
                emphasized: String? = nil,
                heavy: String? = nil,
                black: String? = nil) {
        
        self.regular = regular

        if let ultraLight = ultraLight { self.ultraLight = ultraLight }
        if let thin       = thin       { self.thin = thin }
        if let light      = light      { self.light = light }
        if let oblique    = oblique    { self.oblique = oblique }
        if let medium     = medium     { self.medium = medium }
        if let semibold   = semibold   { self.semibold = semibold }
        if let bold       = bold       { self.bold = bold }
        if let emphasized = emphasized { self.emphasized = emphasized }
        if let heavy      = heavy      { self.heavy = heavy }
        if let black      = black      { self.black = black }
        
    }
}
