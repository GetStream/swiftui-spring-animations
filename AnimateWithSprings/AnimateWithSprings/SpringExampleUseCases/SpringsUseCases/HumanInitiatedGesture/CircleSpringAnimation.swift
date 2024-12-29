import SwiftUI

// MARK: Interact directly with your device screen with gestural spring animations

struct CircleSpringAnimation: View {
    @State private var offset: CGFloat = 0
    @State private var isDraggingLeft = false
    
    var body: some View {
        GeometryReader { geometry in
            Circle()
                .fill(Color.blue)
                .frame(width: 100, height: 100)
                .position(x: geometry.size.width / 2 + offset, y: geometry.size.height / 2) // Center the circle
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            offset = value.translation.width
                            isDraggingLeft = offset < 0
                        }
                        .onEnded { _ in
                            withAnimation(springAnimation) {
                                offset = 0 // Animate back to center
                            }
                        }
                )
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
            return .spring(duration: 0.6, bounce: 0.8)
        }
    }
}

struct CircleSpringAnimation_Previews: PreviewProvider {
    static var previews: some View {
        CircleSpringAnimation()
    }
}

// End of file. No additional code.
