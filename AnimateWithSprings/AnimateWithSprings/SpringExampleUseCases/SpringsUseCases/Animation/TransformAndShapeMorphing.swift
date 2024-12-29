//
//  RectToRoundedRectToCircle.swift
//  AnimateWithSprings
//
//  Multi-step animation: A repeating animation that loops continuosly. Morph a rectangle to a rounded version and into a circle repeatedly. This uses chained animations. 
//

import SwiftUI

enum RectAnimationPhase {
    case start, middle, end
}

struct TransformAndShapeMorphing: View {
    var body: some View {
        Rectangle()
            .fill(.blue.gradient)
            .frame(width: 200, height: 200)
            .phaseAnimator([RectAnimationPhase.start, .middle, .end], content: { view, phase in
                view
                    .cornerRadius(phase == .start ? 0 :
                                    phase == .middle ? 32 : 100)
                    .rotationEffect(.degrees(phase == .middle ? 180 : 0))
            }, animation: { phase in
                switch phase {
                case .start: return .spring(duration: 1)
                case .middle: return .spring(duration: 1)
                case .end: return .spring(duration: 1)
                }
            })
    }
}

// Preview remains the same
#Preview {
    TransformAndShapeMorphing()
        .preferredColorScheme(.dark)
}
