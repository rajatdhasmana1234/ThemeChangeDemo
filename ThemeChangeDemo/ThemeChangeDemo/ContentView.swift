//
//  ContentView.swift
//  ThemeChangeDemo
//
//  Created by RAJAT DHASMANA on 10/03/22.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("theme") var currentThemeRawValue: String = "dark"

    var body: some View {
        HomeView()
            .environment(\.colorScheme, HelperClass.getTheme(themeStr: currentThemeRawValue))

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
