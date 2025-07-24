//
//  CardView.swift
//  Naruto
//
//  Created by Denis Ivaschenko on 24.07.2025.
//

import SwiftUI

struct CardView: View {
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                
                Rectangle()
                    .cornerRadius(20)
                    .frame(height: geometry.size.height / 2)
                    .padding(.top)
                
                
            }
        }
    }
}

#Preview {
    CardView()
}
