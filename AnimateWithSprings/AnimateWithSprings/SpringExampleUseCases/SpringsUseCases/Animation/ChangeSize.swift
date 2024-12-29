import SwiftUI

// MARK: An onscreen object changes size

struct ChangeSize: View {
    var body: some View {
        // Use PhaseAnimator to continuously animate between two scale values
        PhaseAnimator([1.0, 0.5]) { scale in
            Circle()
                .fill(Color.blue)
                .frame(width: 80, height: 80)
                .scaleEffect(scale)
        } animation: { _ in
            .spring(duration: 1, bounce: 0.3)
        }
    }
}

#Preview {
    ChangeSize()
        .preferredColorScheme(.dark)
}

// End of file. No additional code.
