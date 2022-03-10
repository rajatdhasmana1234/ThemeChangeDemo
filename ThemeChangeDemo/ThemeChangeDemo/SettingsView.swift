//
//  SettingsView.swift
//  ThemeChangeDemo
//
//  Created by RAJAT DHASMANA on 10/03/22.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        ZStack {
            
            Color("AppBackgroundColor")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Button {
                    
                    let currentTheme = UserDefaultsHelper.getCurrentTheme()
                    switch currentTheme {
                    case Theme.dark.rawValue:
                        UserDefaultsHelper.saveTheme(theme: .light)
                    case Theme.light.rawValue:
                        UserDefaultsHelper.saveTheme(theme: .dark)
                    default:
                        UserDefaultsHelper.saveTheme(theme: .light)
                    }
                } label: {
                    Text("Toggle theme")
                        .padding()
                }
                
                Button {
                    dismiss()
                } label: {
                    Text("Dismiss")
                        .padding()
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
