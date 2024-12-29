import SwiftUI

// MARK: Model a spring animation based on existing spring parameters. 

struct SpringModeling: View {
    // Animation phases
    enum AnimationPhase: CaseIterable {
        case zero, oneEighty
    }
    
    var body: some View {
        // Spring Model
        let mySpring = Spring(duration: 2.0, bounce: 0.2)
        let (mass, stiffness, damping) = (mySpring.mass, mySpring.stiffness, mySpring.damping)
        
        return PhaseAnimator(AnimationPhase.allCases) { phase in
            ZStack {
                Divider()
                Circle()
                    .trim(from: 0.5)
                    .stroke(.quaternary, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round, dash: [8, 8]))
                    .frame(width: 360, height: 360)
                Circle()
                    .fill(Color.blue)
                    .frame(width: 25, height: 25)
                    .offset(x: -180)
                    .rotationEffect(phase == .zero ? .degrees(0) : .degrees(180))
            }
            .padding()
        } animation: { phase in
            //.spring(duration: mySpring.duration, bounce: mySpring.bounce)
            .interpolatingSpring(mass: mass, stiffness: stiffness, damping: damping, initialVelocity: 1)
        }
    }
}

#Preview {
    SpringModeling()
}
