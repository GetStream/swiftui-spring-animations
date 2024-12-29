//
//  SpringWithLargeBounce.swift
//  AnimateWithSprings

import SwiftUI

enum LargeBouncePhases {
    case start, middle, end
}

struct SpringWithLargeBounce: View {
    var body: some View {
        Rectangle()
            .fill(.blue.gradient)
            .frame(width: 200, height: 200)
            .phaseAnimator([LargeBouncePhases.start, .middle, .end], content: { view, morthRotate in
                view
                    .cornerRadius(morthRotate == .start ? 0 :
                                    morthRotate == .middle ? 32 : 100)
                    .rotationEffect(.degrees(morthRotate == .middle ? 180 : 0))
            }, animation: { morthRotate in
                switch morthRotate {
                case .start: return .spring(duration: 0.5, bounce: 0.3)
                case .middle: return .spring(duration: 0.5, bounce: 0.3)
                case .end: return .spring(duration: 0.5, bounce: 0.3)
                }
            })
    }
}

#Preview {
    SpringWithLargeBounce()
}
