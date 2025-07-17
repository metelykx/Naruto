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
                Label("Friends", systemImage: "figure.2")
            }
            
            EnemiesView().tabItem {
                Label("Enemies", systemImage: "figure.fall")
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
