//
//  ChainedSpring.swift
//  AnimateWithSprings
//
//  Created by Amos Gyamfi on 24.12.2024.
//

import SwiftUI

struct ChainedSpring: View {
    @State private var moving = false
    
    // Added constants for common values
    private let baseSize: CGFloat = 20
    private let sizeIncrement: CGFloat = 30
    private let delayIncrement: CGFloat = 0.05
    private let circleCount = 8
    
    // Added AnimatedCircle view component
    private struct AnimatedCircle: View {
        let size: CGFloat
        let delay: Double
        let moving: Bool
        
        var body: some View {
            Circle()
                .stroke(lineWidth: 5)
                .frame(width: size, height: size)
                .rotation3DEffect(.degrees(75), axis: (x: 1, y: 0, z: 0))
                .offset(y: moving ? 150 : -180)
                .animation(
                    .bouncy(duration: 0.5, extraBounce: 0.25).repeatForever(autoreverses: true)
                        .delay(delay),
                    value: moving
                )
        }
    }
    
    var body: some View {
        ZStack {
            ForEach(0..<circleCount, id: \.self) { index in
                AnimatedCircle(
                    size: baseSize + (CGFloat(index) * sizeIncrement),
                    delay: Double(index) * delayIncrement,
                    moving: moving
                )
            }
        }
        .onAppear {
            moving.toggle()
        }
    }
}

#Preview {
    ChainedSpring()
        .preferredColorScheme(.dark)
}
