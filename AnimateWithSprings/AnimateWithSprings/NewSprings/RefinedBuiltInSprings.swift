//
//  BuiltInSprings.swift
//  AnimateWithSprings
//
//  Smooth, Snappy, Bouncy
//

import SwiftUI

struct BuiltInSprings: View {
    @State private var isScaled: Bool = false
    
    var body: some View {
        HStack {
            Image(.amosAndKid)
                .resizable()
                .clipShape(.circle)
                .scaledToFit()
                .frame(width: 120, height:  120)
                .phaseAnimator([false, true], trigger: isScaled) { photo, enlarge in
                    
                    Button {
                       isScaled.toggle()
                    } label: {
                        photo
                            .scaleEffect(isScaled ? 1.5 : 1)
                    }
                    .buttonStyle(.plain)
                    
                } animation: { enlarge in
                        .bouncy()
                }
        }
    }
}

#Preview {
    BuiltInSprings()
        .preferredColorScheme(.dark)
}
