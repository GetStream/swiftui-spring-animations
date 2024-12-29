import SwiftUI

// MARK: An onscreen object moves with a drag gesture

struct DragFromAToB: View {
    // State to track the circle's position
    @State private var position = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
    
    // State to track the drag gesture's translation
    @State private var dragOffset = CGSize.zero
    
    var body: some View {
        Circle()
            .fill(Color.blue)
            .frame(width: 80, height: 80)
            .position(position)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        // Update the position while dragging
                        self.position = CGPoint(x: value.location.x, y: value.location.y)
                    }
                    .onEnded { _ in
                        // Animate back to center when released
                        withAnimation(.spring(duration: 1, bounce: 0.5)) {
                            self.position = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
                        }
                    }
            )
    }
}

#Preview {
    DragFromAToB()
        .preferredColorScheme(.dark)
}

// End of file. No additional code.
