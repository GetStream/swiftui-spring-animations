//
//  InitialVelocity.swift
//  AnimateWithSprings
import SwiftUI

// Renamed struct to reflect new behavior
struct InitialVelocity: View {
    // State to track the circle's position
    @State private var position = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Circle remains the same
                Circle()
                    .fill(Color.blue)
                    .frame(width: 80, height: 80)
                    .position(position)
                
                // Replace Color.clear and gesture with Rectangle and onTapGesture
                Rectangle()
                    .fill(Color.clear)
                    .contentShape(Rectangle())
                    .onTapGesture { location in
                        // Animate to tapped position
                        withAnimation(.spring(duration: 1, bounce: 0.5)) {
                            self.position = location
                        }
                    }
            }
        }
    }
}

#Preview {
    InitialVelocity()
        .preferredColorScheme(.dark)
}
