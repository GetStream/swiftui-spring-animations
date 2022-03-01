//
//  DampingFractionBounce.swift
//  An interpolating spring with stiffness and damping as parameters
//
//  Created by Amos from getstream.io
//

import SwiftUI

struct DampingFractionBounce: View {
    
    @State private var moving = false
    
    var body: some View {
        VStack(alignment: .trailing) {
            // Ball 1, DF = Damping Fraction
            HStack {
                Text("High bounce: DF = 0.2")
                Image("ball")
                    .offset(x: moving ? 0 : 100)
                    // High bounce: Damping fraction = 0.2
                    .animation(.spring(response: 0.55, dampingFraction: 0.2, blendDuration: 0.0).repeatForever(autoreverses: false), value: moving)
            }
            
            // Ball 2
            HStack {
                Text("Medium bounce: DF = 0.5")
                Image("ball")
                    .offset(x:  moving ? 0 : 100)
                    // Medium bounce: Damping fraction = 0.5
                    .animation(.spring(response: 0.55, dampingFraction: 0.5, blendDuration: 0.0).repeatForever(autoreverses: false), value: moving)
            }
            
            // Ball 3
            HStack {
                Text("Low bounce: DF = 0.75")
                Image("ball")
                    .offset(x:  moving ? 0 : 100)
                    // Low bounce: Damping fraction = 0.75
                    .animation(.spring(response: 0.55, dampingFraction: 0.75, blendDuration: 0.0).repeatForever(autoreverses: false), value: moving)
            }
            
            // Ball 4
            HStack {
                Text("No bounce: DF = 1")
                Image("ball")
                    .offset(x:  moving ? 0 : 100)
                    // No bounce: Damping fraction = 1
                    .animation(.spring(response: 0.55, dampingFraction: 1, blendDuration: 0.0).repeatForever(autoreverses: false), value: moving)
            }
        } // All balls
        .onAppear{
            moving.toggle()
        }
    }
}

struct DampingFractionBounce_Previews: PreviewProvider {
    static var previews: some View {
        DampingFractionBounce()
            .preferredColorScheme(.dark)
.previewInterfaceOrientation(.landscapeLeft)
    }
}
