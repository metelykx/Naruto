//
//  CardView.swift
//  Naruto
//
//  Created by Denis Ivaschenko on 24.07.2025.
//

import SwiftUI

struct CardView: View {
    
    var body: some View {
        VStack(spacing: 0){
        GeometryReader { geometry in
            ZStack{
                Rectangle()
                    .cornerRadius(20)
                    .frame(height: geometry.size.height / 2)
                    .padding(.top)
                    .padding(.horizontal)
                
                
                    Rectangle()
                        .foregroundStyle(.gray)
                        .frame(height: geometry.size.height / 3)
                        .padding(.horizontal)
                        .cornerRadius(20)
                        
                        
                        
                    
                }
                
            }
        }
    }
}

#Preview {
    CardView()
}
