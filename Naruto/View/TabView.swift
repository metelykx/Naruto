//
//  TabView.swift
//  Naruto
//
//  Created by Denis Ivaschenko on 17.07.2025.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            ContentView().tabItem {
                Label("Home", systemImage: "house")
            }
            
            AddCharacter().tabItem{ Label("Add Heroes", systemImage: "person.crop.rectangle.badge.plus.fill")
            }
            
            SettingsView().tabItem {
                Label("Settings", systemImage: "gearshape.fill")
            }
        }
    }
}


#Preview {
    TabBarView()
}
