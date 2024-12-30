//
//  SilentRing.swift
//  AnimateWithSprings
//
//  Created by Amos Gyamfi on 24.12.2024.
//

import SwiftUI

struct SilentRing: View {
    @State private var ringing = false
    let hearable = Animation.spring(response: 0.2, dampingFraction: 0.3, blendDuration: 0).repeatCount(1, autoreverses: true)
    let silent = Animation.interpolatingSpring(mass: 1, stiffness: 170, damping: 15, initialVelocity: 4).repeatCount(1, autoreverses: true)
    let centerOfGravity: UnitPoint = .topTrailing
    
    var body: some View {
        HStack {
            Text(ringing ? "Ring" : "Silent")
            
            Toggle(isOn: $ringing,
                   label: {
                Image(systemName: ringing ? "bell.fill" : "bell.slash.fill")
                    .phaseAnimator([false, true], trigger: ringing) {
                        bellIcon, crownRotate in
                        
                        bellIcon
                            .font(.largeTitle)
                            .contentTransition(.symbolEffect(.replace))
                            .rotationEffect(.degrees(crownRotate ? 15 : 0), anchor: centerOfGravity)
                            .foregroundStyle(ringing ? Color(.systemGreen) : .white)
                    } animation: { crownRotate in
                        ringing ? hearable : silent
                    }
            })
        }
        .padding()
    }
}


#Preview {
    SilentRing()
        .preferredColorScheme(.dark)
}
