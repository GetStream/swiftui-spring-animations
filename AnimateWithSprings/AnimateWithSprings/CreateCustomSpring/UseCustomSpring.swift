//
//  UseCustomSpring.swift
//  AnimateWithSprings
//
//  BouncyNoBounce.swift
//  MARK: Use .spring and specify your perceptual duration and bounce.  .spring(duration: 0.6, bounce: 0.0)

import SwiftUI

struct UseCustomSpring: View {
    @State private var offset: CGFloat = 0
    @State private var isDraggingLeft = false
    @State private var isDragging = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Circle()
                    .fill(Color.blue)
                    .frame(width: 100, height: 100)
                    .overlay(
                        // Show text only when dragged to left or right and while dragging
                        Group {
                            if abs(offset) > 50 && isDragging {
                                Text(isDraggingLeft ? "No Bounce" : "Bouncy")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .bold))
                            }
                        }
                    )
                    .position(x: geometry.size.width / 2 + offset, y: geometry.size.height / 2) // Center the circle
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                offset = value.translation.width
                                isDraggingLeft = offset < 0
                                isDragging = true // Set dragging to true
                            }
                            .onEnded { _ in
                                isDragging = false // Set dragging to false immediately
                                withAnimation(springAnimation) {
                                    offset = 0 // Animate back to center
                                }
                            }
                    )
            }
        }
    }
    
    var springAnimation: Animation {
        if isDraggingLeft {
            // Snappy spring for left dragging
            //return .spring(response: 0.3, dampingFraction: 0.7, blendDuration: 0)
            return .spring(duration: 0.6, bounce: 0.0)
        } else {
            // Bouncy spring for right dragging
            //return .spring(response: 0.6, dampingFraction: 0.4, blendDuration: 0)
            return .spring(duration: 0.6, bounce: 0.7)
        }
    }
}

#Preview {
    UseCustomSpring()
        .preferredColorScheme(.dark)
}
