import SwiftUI

// Getting smooth, snappy, and bouncy spring characteristics from a basic spring

struct BasicSmoothSnappyBouncy: View {
    @State private var withBuiltInSpring: Bool = false
    @State private var selectedSpring: BasicTraditionalSpring = .smooth
    @State private var imageScale: CGFloat = 1.0

    enum BasicTraditionalSpring: String, CaseIterable {
        case smooth = "Smooth"
        case snappy = "Snappy"
        case bounce = "Bouncy"
    }

    var animation: Animation {
        switch selectedSpring {
            // Basic traditional smooth Spring: mass, stiffness, damping
        case .smooth:
            return .interpolatingSpring(mass: 0.2, stiffness: 25, damping: 5)
        
            // Basic traditional snappy Spring: mass, stiffness, damping. Absence of mass create a basic snappy spring
        case .snappy:
            return .interpolatingSpring(mass: 0.1, stiffness: 100, damping: 5)
            
            // Basic traditional bouncy Spring: mass, stiffness, damping
        case .bounce:
            return .interpolatingSpring(mass: 1, stiffness: 100, damping: 5)
        }
    }

    var body: some View {
        VStack {
            Picker("Spring Type", selection: $selectedSpring) {
                ForEach(BasicTraditionalSpring.allCases, id: \.self) { spring in
                    Text(spring.rawValue)
                        .tag(spring)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            Image("amosAndKid")
                .resizable()
                .clipShape(Circle())
                .scaledToFit()
                .frame(width: 120, height: 120)
                .scaleEffect(imageScale)
                .onTapGesture {
                    withBuiltInSpring.toggle()
                    withAnimation(animation) {
                        imageScale = withBuiltInSpring ? 1.5 : 1.0
                    }
                }
        }
    }
}

#Preview {
    BasicSmoothSnappyBouncy()
        .preferredColorScheme(.dark)
}
