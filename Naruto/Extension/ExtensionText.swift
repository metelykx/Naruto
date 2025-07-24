//
//  ExtensionText.swift
//  Naruto
//
//  Created by Denis Ivaschenko on 24.07.2025.
//

import Foundation
import SwiftUI

extension Text {
    
    func colorText() -> Color {
        let useGray = UserDefaults.standard.bool(forKey: "useGrayText")
        if useGray {
            return .white
        } else {
            return .gray
        }
    }
    
    //title
    func titleFont() -> some View {
        self
            .foregroundStyle(.primary)
            .font(.system(size: 16, weight: .bold, design: .rounded))
            .opacity(0.8)
    }
    
    //description
    func descriptionFont() -> some View {
        self
            .foregroundStyle(.primary)
            .font(.system(size: 14, weight: .medium, design: .rounded))
            .opacity(0.8)
    }
}
