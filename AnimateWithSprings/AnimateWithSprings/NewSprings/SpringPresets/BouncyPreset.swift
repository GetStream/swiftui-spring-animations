//
//  BouncyPreset.swift
//  AnimateWithSprings


import SwiftUI

enum BouncyPhases {
    case start, middle, end
}

struct BouncyPreset: View {
    var body: some View {
        Rectangle()
            .fill(.blue.gradient)
            .frame(width: 200, height: 200)
            .phaseAnimator([BouncyPhases.start, .middle, .end], content: { view, bounce in
                view
                    .cornerRadius(bounce == .start ? 0 :
                                    bounce == .middle ? 32 : 100)
                    .rotationEffect(.degrees(bounce == .middle ? 180 : 0))
            }, animation: { bounce in
                switch bounce {
                case .start: return .bouncy
                case .middle: return .bouncy
                case .end: return .bouncy
                }
            })
    }
}

#Preview {
    BouncyPreset()
        .preferredColorScheme(.dark)
}
