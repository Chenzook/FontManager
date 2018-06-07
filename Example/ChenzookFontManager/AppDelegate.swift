//
//  AppDelegate.swift
//  ChenzookFontManager
//
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
import ChenzookFontManager

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        ChenzookFontManager.overrideSystemFont(fontName: "SnellRoundhand")
        return true
    }


}

