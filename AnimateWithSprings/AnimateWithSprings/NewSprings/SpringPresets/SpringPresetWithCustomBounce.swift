//
//  SpringPresetWithCustomBounce.swift
//  AnimateWithSprings

import SwiftUI

enum BouncePhases {
    case start, middle, end
}

struct SpringPresetWithCustomBounce: View {
    var body: some View {
        Rectangle()
            .fill(.blue.gradient)
            .frame(width: 200, height: 200)
            .phaseAnimator([BouncePhases.start, .middle, .end], content: { view, morthRotate in
                view
                    .cornerRadius(morthRotate == .start ? 0 :
                                    morthRotate == .middle ? 32 : 100)
                    .rotationEffect(.degrees(morthRotate == .middle ? 180 : 0))
            }, animation: { morthRotate in
                switch morthRotate {
                case .start: return .snappy(extraBounce: 0.1)
                case .middle: return .smooth(extraBounce: 0.1)
                case .end: return .bouncy(extraBounce: 0.1)
                }
            })
    }
}

#Preview {
    SpringPresetWithCustomBounce()
        .preferredColorScheme(.dark)
}
