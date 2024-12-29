import SwiftUI

// MARK: An onscreen object moves from one point to another

struct MoveFromAToB: View {
    // Define the two points for horizontal animation
    let pointA = CGPoint(x: 60, y: 330) // Changed x to 50
    let pointB = CGPoint(x: 700, y: 330) // Changed x to 350
    
    var body: some View {
        PhaseAnimator([pointA, pointB]) { point in
            Circle()
                .fill(Color.blue)
                .frame(width: 80, height: 80)
                .position(point)
        } animation: { _ in
            .spring(duration: 1, bounce: 0.3)
        }
    }
}

#Preview {
    MoveFromAToB()
        .preferredColorScheme(.dark)
}

// End of file. No additional code.
