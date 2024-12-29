//
//  TextSpringEffect.swift
//  AnimateWithSprings
//
//  Created by Amos Gyamfi on 24.12.2024.
//

import SwiftUI

struct TextSpringEffect: View {
    
    let letters = Array("SpringAnimation")
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<letters.count) { num in
                Text(String(letters[num]))
                    .padding(5)
                    .font(.title)
                    .background(enabled ? .blue : .red)
                    .hueRotation(.degrees(enabled ? 0 : 150))
                    .rotationEffect(.degrees(enabled ? 0 : 360), anchor: .bottomLeading)
                    .border(.white)
                    .cornerRadius(2)
                    .offset(dragAmount)
                    .animation(.interpolatingSpring(stiffness: 170, damping: 5).delay(Double(num) / 20), value: dragAmount)
            }
        }
        .padding()
        .gesture(
            DragGesture()
                .onChanged { dragAmount = $0.translation }
            // _ ignore the value coming in this time
                .onEnded { _ in
                    withAnimation{
                        dragAmount = .zero
                        enabled.toggle()
                    }
                }
        )
    }
}

#Preview {
    TextSpringEffect()
        .preferredColorScheme(.dark)
}
