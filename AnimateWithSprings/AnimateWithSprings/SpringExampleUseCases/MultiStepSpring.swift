//
//  MultiStepSpring.swift
//  AnimateWithSprings
//
//  Created by Amos Gyamfi on 13.12.2024.
//

import SwiftUI

struct MultiStepSpring: View {
    // Added state for tracking tap
    @State private var isTapped = false
    var body: some View {
        // Remove previous VStack and Circle
        PhaseAnimator([0.7, 1.0, 0.3]) { phase in
            Circle()
                .fill(.green)
                .frame(width: 100, height: 100)
                .scaleEffect(isTapped ? phase : 1.0)
        } animation: { phase in
            let spring = Spring(mass: 1, stiffness: 100, damping: 10)
            return Animation.spring(spring)
        }
        .onTapGesture {
            isTapped.toggle()
        }
    }
}

#Preview {
    MultiStepSpring()
        .preferredColorScheme(.dark)
}
