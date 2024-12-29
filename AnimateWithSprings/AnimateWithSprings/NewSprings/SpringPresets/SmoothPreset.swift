//
//  SmoothPreset.swift
//  AnimateWithSprings


import SwiftUI

enum SmoothPhases {
    case start, middle, end
}

struct SmoothPreset: View {
    var body: some View {
        Rectangle()
            .fill(.blue.gradient)
            .frame(width: 200, height: 200)
            .phaseAnimator([SmoothPhases.start, .middle, .end], content: { view, smooth in
                view
                    .cornerRadius(smooth == .start ? 0 :
                                    smooth == .middle ? 32 : 100)
                    .rotationEffect(.degrees(smooth == .middle ? 180 : 0))
            }, animation: { smooth in
                switch smooth {
                case .start: return .smooth
                case .middle: return .smooth
                case .end: return .smooth
                }
            })
    }
}

#Preview {
    SmoothPreset()
        .preferredColorScheme(.dark)
}
