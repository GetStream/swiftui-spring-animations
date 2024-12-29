import SwiftUI

// MARK: Use a spring with a 0 bounce value to create a relaxed effect

enum BreathPhase: CaseIterable {
    case inhale
    case exhale
}

struct RelaxedEffect: View {
    @State private var currentPhase: BreathPhase = .inhale
    
    var body: some View {
        NavigationStack {
            VStack {
                Text(currentPhase == .inhale ? "Inhale" : "Exhale")
                    .font(.title)
                
                Spacer()
                
                ZStack {
                    // Bottom V
                    Text("V")
                        .offset(x: currentPhase == .exhale ? -25 : 0)
                        .rotationEffect(.degrees(currentPhase == .exhale ? -90 : 0), anchor: .bottom)
                    
                    // Middle V
                    Text("V")
                        .offset(y: currentPhase == .exhale ? -25 : 0)
                    
                    // Top V
                    Text("V")
                        .offset(x: currentPhase == .exhale ? 25 : 0)
                        .rotationEffect(.degrees(currentPhase == .exhale ? 90 : 0), anchor: .bottom)
                }
                .font(.system(size: 128))
                .bold()
                
                Spacer()
            }
            .padding()
            .onAppear {
                withAnimation(nil) {
                    currentPhase = .inhale
                }
                animateBreathing()
            }
        }
    }
    
    private func animateBreathing() {
        withAnimation(.spring(duration: 2, bounce: 0.0)) {
            currentPhase = currentPhase == .inhale ? .exhale : .inhale
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            withAnimation(.spring(duration: 2, bounce: 0.0)) {
                animateBreathing()
            }
        }
    }
}

#Preview {
    RelaxedEffect()
        .preferredColorScheme(.dark)
}
