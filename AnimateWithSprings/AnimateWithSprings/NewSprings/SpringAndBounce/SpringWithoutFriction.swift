//
//  SpringWithoutFriction.swift
//  AnimateWithSprings
// MARK: Set bounce = 100%

import SwiftUI

enum SpringWithoutFrictionPhases {
    case start, middle, end
}

struct SpringWithoutFriction: View {
    var body: some View {
        Rectangle()
            .fill(.blue.gradient)
            .frame(width: 200, height: 200)
            .phaseAnimator([SpringWithoutFrictionPhases.start, .middle, .end], content: { view, morthRotate in
                view
                    .cornerRadius(morthRotate == .start ? 0 :
                                    morthRotate == .middle ? 32 : 100)
                    .rotationEffect(.degrees(morthRotate == .middle ? 180 : 0))
            }, animation: { morthRotate in
                switch morthRotate {
                case .start: return .spring(duration: 1.0, bounce: 1.0)
                case .middle: return .spring(duration: 1.0, bounce: 1.0)
                case .end: return .spring(duration: 1.0, bounce: 1.0)
                }
            })
    }
}

#Preview {
    SpringWithoutFriction()
}
