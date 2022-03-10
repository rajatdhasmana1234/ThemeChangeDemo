//
//  ThemeChangeDemoApp.swift
//  ThemeChangeDemo
//
//  Created by RAJAT DHASMANA on 10/03/22.
//

import SwiftUI

@main
struct ThemeChangeDemoApp: App {
    
    @StateObject var viewModel = AppViewModel()
    @AppStorage("theme") var currentThemeRawValue: String = "dark"
    var body: some Scene {
        WindowGroup {
            ContentView()
//                .environment(\.colorScheme, currentThemeRawValue == "dark" ? .dark : .light)
                .environment(\.colorScheme, HelperClass.getTheme(themeStr: currentThemeRawValue))

        }
    }
}

class AppViewModel: ObservableObject {
    
    var theme: Theme = .dark
    
    init() {
        UserDefaultsHelper.registerDefaultValues()
    }
}


struct HelperClass {
    
    static func getTheme(themeStr: String) -> ColorScheme {
        
        if let theme = Theme(rawValue: themeStr) {
            return ColorScheme(theme.uiInterfaceStyle) ?? .dark
        } else {
            return .dark
        }
    }
}
