//
//  SnappyPreset.swift
//  AnimateWithSprings


import SwiftUI

enum SnappyPhases {
    case start, middle, end
}

struct SnappyPreset: View {
    var body: some View {
        Rectangle()
            .fill(.blue.gradient)
            .frame(width: 200, height: 200)
            .phaseAnimator([SnappyPhases.start, .middle, .end], content: { view, snap in
                view
                    .cornerRadius(snap == .start ? 0 :
                                    snap == .middle ? 32 : 100)
                    .rotationEffect(.degrees(snap == .middle ? 180 : 0))
            }, animation: { snap in
                switch snap {
                case .start: return .snappy
                case .middle: return .snappy
                case .end: return .snappy
                }
            })
    }
}

#Preview {
    SnappyPreset()
        .preferredColorScheme(.dark)
}
