//
//  CustomSpring.swift
//  AnimateWithSprings
//
//
//  SpringPresetWithCustomBounce.swift
//  AnimateWithSprings

import SwiftUI

enum CustomSpringPhases {
    case start, middle, end
}

struct CustomSpring: View {
    var body: some View {
        Rectangle()
            .fill(.blue.gradient)
            .frame(width: 200, height: 200)
            .phaseAnimator([CustomSpringPhases.start, .middle, .end], content: { view, morthRotate in
                view
                    .cornerRadius(morthRotate == .start ? 0 :
                                    morthRotate == .middle ? 32 : 100)
                    .rotationEffect(.degrees(morthRotate == .middle ? 180 : 0))
            }, animation: { morthRotate in
                switch morthRotate {
                case .start: return .spring(duration: 0.6, bounce: 0.2)
                case .middle: return .spring(duration: 0.6, bounce: 0.2)
                case .end: return .spring(duration: 0.6, bounce: 0.2)
                }
            })
    }
}

#Preview {
    CustomSpring()
        .preferredColorScheme(.dark)
}
