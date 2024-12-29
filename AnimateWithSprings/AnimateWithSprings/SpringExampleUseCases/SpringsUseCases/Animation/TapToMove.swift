import SwiftUI

// Simulation of initial velocity. Tap anywhere on the screen to move the circle. Tap one point followed by another point immediately to see the initial velocity of the spring in action. 

// Renamed struct to reflect new behavior
struct TapToMove: View {
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
    TapToMove()
        .preferredColorScheme(.dark)
}

// End of file. No additional code.
