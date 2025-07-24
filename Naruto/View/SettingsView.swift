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
                                    .toggleStyle(SwitchToggleStyle(tint: .green))
                                        .contentShape(Rectangle())
                                        .padding()
                                        .background(useGray ? Color.green.opacity(0.1) : Color.clear)
                                        .cornerRadius(12)
                                        .animation(.spring(), value: useGray)
                            }
                        }
                        .navigationTitle(Text("Settings"))
                        
            }
        }
}


#Preview {
    SettingsView()
}
