//
//  HomeView.swift
//  ThemeChangeDemo
//
//  Created by RAJAT DHASMANA on 10/03/22.
//

import SwiftUI

struct HomeView: View {
    @State private var theme: Theme = .dark
    @State private var openSettings = false
    @AppStorage("theme") var currentThemeRawValue: String = "dark"

    var body: some View {
        
        ZStack {
            
            Color("AppBackgroundColor")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Current Theme is -> \(UserDefaultsHelper.getCurrentTheme())")
                    .padding()
                
                Button {
                    openSettings.toggle()
                } label: {
                    Text("Open Settings")
                        .padding()
                }
            }
        }
        .sheet(isPresented: $openSettings) {
            SettingsView()
                .environment(\.colorScheme, HelperClass.getTheme(themeStr: currentThemeRawValue))
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}



enum Theme: String {
    case dark
    case light
    
    var colorScheme : ColorScheme {
        
        return ColorScheme(self.uiInterfaceStyle) ?? .dark
    }
    
    var uiInterfaceStyle: UIUserInterfaceStyle {
        
        switch self {
        case .dark:
            return .dark
        case .light:
            return .light
        }
    }
}
