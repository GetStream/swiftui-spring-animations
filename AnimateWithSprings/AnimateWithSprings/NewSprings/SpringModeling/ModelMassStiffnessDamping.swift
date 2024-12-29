import SwiftUI

struct ModelMassStiffnessDamping: View {
    @State private var isActive = false
    
    var body: some View {
        VStack {
            Circle()
                .fill(isActive ? .green : .gray)
                .frame(width: 100, height: 100)
                .offset(x: isActive ? 100 : -100)
                .animation(animation, value: isActive)
            
            Toggle("Toggle", isOn: $isActive)
                .padding()
        }
    }
    
    private var animation: Animation {
        let otherSpring = Spring(mass: 1, stiffness: 100, damping: 10)
        return Animation.spring(otherSpring)
    }
}

#Preview {
    ModelMassStiffnessDamping()
        .preferredColorScheme(.dark)
}
