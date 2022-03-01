//
//  StiffnessDamping.swift

//  Stiffness and damping variations: Stiff, gentle, wobble, no wobble
//
//  Created by Amos from getstream.io
//

import SwiftUI

struct StiffnessDamping: View {
    
    @State private var moving = false
    
    var body: some View {
        VStack(alignment: .leading) {
            // Ball 1
            HStack(spacing: 50) {
                Text("Stiff: ")
                Image("ball")
                    .offset(x: moving ? 0 : 100)
                    .animation(.interpolatingSpring(stiffness: 210, damping: 20).repeatForever(autoreverses: true), value: moving)
            }
            
            // Ball 2
            HStack(spacing: 50) {
                Text("Gentle: ")
                Image("ball")
                    .offset(x: moving ? 0 : 100)
                    .animation(.interpolatingSpring(stiffness: 120, damping: 14).repeatForever(autoreverses: true), value: moving)
            }
            
            // Ball 3
            HStack(spacing: 50) {
                Text("Wobble: ")
                Image("ball")
                    .offset(x: moving ? 0 : 100)
                    .animation(.interpolatingSpring(stiffness: 180, damping: 12).repeatForever(autoreverses: true), value: moving)
            }
            
            // Ball 4
            HStack(spacing: 50) {
                Text("No wobble: ")
                Image("ball")
                    .offset(x: moving ? 0 : 100)
                    .animation(.interpolatingSpring(stiffness: 170, damping: 26).repeatForever(autoreverses: false), value: moving)
            }
        } // All balls
        .onAppear{
            moving.toggle()
        }
    }
}

struct StiffnessDamping_Previews: PreviewProvider {
    static var previews: some View {
        StiffnessDamping()
            .preferredColorScheme(.dark)
    }
}
