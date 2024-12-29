//
//  SmoothSnappyBouncySpring.swift
//  AnimateWithSprings

import SwiftUI

// Getting smooth, snappy, and bouncy spring characteristics from basic and advanced springs

struct SmoothSnappyBouncySpring: View {
    @State private var withBuiltInSpring: Bool = false
    @State private var selectedSpring: BuiltInSpring = .smooth
    @State private var imageScale: CGFloat = 1.0

    enum BuiltInSpring: String, CaseIterable {
        case smooth = "Smooth"
        case snappy = "Snappy"
        case bounce = "Bouncy"
    }

    var animation: Animation {
        switch selectedSpring {
        case .smooth:
            return .smooth
        
        case .snappy:
            return .snappy
            
        case .bounce:
            return .bouncy
        }
    }

    var body: some View {
        VStack {
            Picker("Spring Type", selection: $selectedSpring) {
                ForEach(BuiltInSpring.allCases, id: \.self) { spring in
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
    SmoothSnappyBouncySpring()
        .preferredColorScheme(.dark)
}
