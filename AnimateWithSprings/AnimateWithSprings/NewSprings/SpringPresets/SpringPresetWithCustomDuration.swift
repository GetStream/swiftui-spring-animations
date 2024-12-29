//
//  SpringPresetWithCustomDuration.swift
//  AnimateWithSprings


import SwiftUI

enum DurationPhases {
    case start, middle, end
}

struct SpringPresetWithCustomDuration: View {
    var body: some View {
        Rectangle()
            .fill(.blue.gradient)
            .frame(width: 200, height: 200)
            .phaseAnimator([DurationPhases.start, .middle, .end], content: { view, morthRotate in
                view
                    .cornerRadius(morthRotate == .start ? 0 :
                                    morthRotate == .middle ? 32 : 100)
                    .rotationEffect(.degrees(morthRotate == .middle ? 180 : 0))
            }, animation: { morthRotate in
                switch morthRotate {
                case .start: return .snappy(duration: 1.0)
                case .middle: return .smooth(duration: 1.0)
                case .end: return .bouncy(duration: 1.0)
                }
            })
    }
}

#Preview {
    SpringPresetWithCustomDuration()
        .preferredColorScheme(.dark)
}
