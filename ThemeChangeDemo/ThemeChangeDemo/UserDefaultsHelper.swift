//
//  UserDefaultsHelper.swift
//  ThemeChangeDemo
//
//  Created by RAJAT DHASMANA on 10/03/22.
//

import Foundation


struct UserDefaultsHelper {
    
    static func saveTheme(theme: Theme) {
        UserDefaults.standard.set(theme.rawValue, forKey: "theme")
    }
    
    static func registerDefaultValues() {
        UserDefaults.standard.register(defaults: ["theme" : Theme.dark.rawValue])
    }
    
    static func getCurrentTheme() -> String {
        
        if let themeRawValue = UserDefaults.standard.string(forKey: "theme") {
            return themeRawValue
        }else {
            return ""
        }
    }
}
