import SwiftUI

// Add this enum at the top of the file
enum AnimationPhase {
    case initial, drawCircle, scaleGreen, showCheckmark
}

struct ActivityProgressAnimation: View {
    // Add state for animation control
    @State private var isAnimating = false
    
    var body: some View {
        VStack {
            ZStack {
                Circle() // Blue circle
                    .trim(from: 0.0, to: isAnimating ? 0.99 : 0.0)
                    .stroke(style: StrokeStyle(lineWidth: 6, lineCap: .round))
                    .frame(width: 100, height: 100)
                    .foregroundStyle(.blue)
                    .rotationEffect(.degrees(-90))
                    .phaseAnimator([AnimationPhase.initial, .drawCircle], trigger: isAnimating) { content, phase in
                        content
                    } animation: { phase in
                            .bouncy(duration: 1)
                    }
                
                Circle() // Green circle
                    .frame(width: 96, height: 96)
                    .foregroundStyle(.green)
                    .scaleEffect(isAnimating ? 1 : 0)
                    .phaseAnimator([AnimationPhase.drawCircle, .scaleGreen], trigger: isAnimating) { content, phase in
                        content
                    } animation: { phase in
                            .bouncy(duration: 0.5, extraBounce: 0.1).delay(0.3)
                    }
                
                Image(systemName: "checkmark") // Checkmark
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.red)
                    .scaleEffect(isAnimating ? 1 : 0)
                    .rotationEffect(.degrees(isAnimating ? 0 : -60), anchor: .bottom)
                    .phaseAnimator([AnimationPhase.scaleGreen, .showCheckmark], trigger: isAnimating) { content, phase in
                        content
                    } animation: { phase in
                            .bouncy(duration: 0.4, extraBounce: 0.4).delay(0.6)
                    }
            }
            
            Button {
                isAnimating.toggle()
            } label: {
                ZStack {
                    Text("Go")
                }
            }
            .padding()
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    ActivityProgressAnimation()
        .preferredColorScheme(.dark)
}
