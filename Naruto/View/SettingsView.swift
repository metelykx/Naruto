//
//  SettingsView.swift
//  Naruto
//
//  Created by Denis Ivaschenko on 17.07.2025.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("useGrayText") var useGray = false
    var body: some View {
        Text("Settings")
    }
}


#Preview {
    SettingsView()
}
