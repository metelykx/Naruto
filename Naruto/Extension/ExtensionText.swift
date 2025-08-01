//
//  ExtensionText.swift
//  Naruto
//
//  Created by Denis Ivaschenko on 24.07.2025.
//

import Foundation
import SwiftUI

//MARK: Extensions
extension Text {
    // Измененный метод для применения цвета
    func applyTextColor() -> some View {
        let useGray = UserDefaults.standard.bool(forKey: "useGrayText")
        return self.foregroundColor(useGray ? .gray : .primary)
    }
    
    // Модификатор для заголовка
    func titleStyle() -> some View {
        self
            .applyTextColor() // Применяем цвет
            .font(.system(size: 16, weight: .bold, design: .rounded))
    }
    
    // Модификатор для описания
    func descriptionStyle() -> some View {
        self
            .applyTextColor() // Применяем цвет
            .font(.system(size: 14, weight: .medium, design: .rounded))
    }
}
