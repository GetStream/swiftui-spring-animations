//
//  FollowThrough.swift
//  AnimateWithSprings
//
//  Created by Amos Gyamfi on 24.12.2024.
//

import SwiftUI

struct FollowThrough: View {
    
    let letters = Array("🏀 🏀 🏀 🏀 🏀 🏀 🏀 🏀 🏀 🏀 🏀 🏀 🏀 🏀")
    
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(0..<letters.count) { num in
                Text(String(letters[num]))
                    .padding(-10)
                    .font(.largeTitle)
                    .rotationEffect(.degrees(enabled ? 0 : 360), anchor: .bottom)
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
    FollowThrough()
        .preferredColorScheme(.dark)
}
