//
//  PhaseAnimatorSpringBasic.swift
//  AnimateWithSprings
//
//  Created by Amos Gyamfi on 5.12.2024.
import SwiftUI

struct  PhaseAnimatorSpringBasic: View {
    // Define the phases for our animation
    enum AnimationPhase: CaseIterable {
        case start, end
    }
    
    var body: some View {
        PhaseAnimator(AnimationPhase.allCases) { phase in
            Circle()
                .fill(Color.blue)
                .frame(width: 80, height: 80)
                .offset(x: phase == .start ? -100 : 100)
        } animation: { phase in
            switch phase {
            case .start:
                .spring(duration: 0.4, bounce: 0.2)
            case .end:
                .spring(duration: 0.4, bounce: 0.2)
            }
        }
    }
}

#Preview {
    PhaseAnimatorSpringBasic()
        .preferredColorScheme(.dark)
}
