//
//  CustomSpringDuration.swift
//  AnimateWithSprings
//
import SwiftUI

enum CustomSpringDurationPhases {
    case start, middle, end
}

struct CustomSpringDuration: View {
    var body: some View {
        Rectangle()
            .fill(.blue.gradient)
            .frame(width: 200, height: 200)
            .phaseAnimator([CustomSpringDurationPhases.start, .middle, .end], content: { view, morthRotate in
                view
                    .cornerRadius(morthRotate == .start ? 0 :
                                    morthRotate == .middle ? 32 : 100)
                    .rotationEffect(.degrees(morthRotate == .middle ? 180 : 0))
            }, animation: { morthRotate in
                switch morthRotate {
                case .start: return .spring(duration: 1.0)
                case .middle: return .spring(duration: 1.0)
                case .end: return .spring(duration: 1.0)
                }
            })
    }
}

#Preview {
    CustomSpringDuration()
        .preferredColorScheme(.dark)
}
