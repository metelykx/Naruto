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
            NavigationView {
                        Form {
                            Section(header: Text("Text Color")) {
                                Toggle("Use gray Text", isOn: $useGray)
                            }
                        }
                        .navigationTitle(Text("Settings"))
                        
            }
        }
}


#Preview {
    SettingsView()
}
