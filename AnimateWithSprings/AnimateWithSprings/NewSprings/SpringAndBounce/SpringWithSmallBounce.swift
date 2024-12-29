//
//  SpringWithSmallBounce.swift
//  AnimateWithSprings

import SwiftUI

enum SmallBouncePhases {
    case start, middle, end
}

struct SpringWithSmallBounce: View {
    var body: some View {
        Rectangle()
            .fill(.blue.gradient)
            .frame(width: 200, height: 200)
            .phaseAnimator([SmallBouncePhases.start, .middle, .end], content: { view, morthRotate in
                view
                    .cornerRadius(morthRotate == .start ? 0 :
                                    morthRotate == .middle ? 32 : 100)
                    .rotationEffect(.degrees(morthRotate == .middle ? 180 : 0))
            }, animation: { morthRotate in
                switch morthRotate {
                case .start: return .spring(duration: 0.5, bounce: 0.15)
                case .middle: return .spring(duration: 0.5, bounce: 0.15)
                case .end: return .spring(duration: 0.5, bounce: 0.15)
                }
            })
    }
}

#Preview {
    SpringWithSmallBounce()
}
