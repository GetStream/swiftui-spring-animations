//
//  StiffNessBounce.swift
//  Learning SwiftUI Spring Animations: The Basics and Beyond
//
//  Created by Amos from getstream.io

import SwiftUI

struct StiffNessBounce: View {
    
    @State private var moving = false
    
    var body: some View {
        VStack(alignment: .leading) {
            // Ball 1
            HStack(spacing: 50) {
                Text("High Stiffness (Snappier): ")
                Image("ball")
                    .offset(x: moving ? 0 : 100)
                    // High Stiffness: A higher stiffness will result in a snappier animation.
                    .animation(.interpolatingSpring(stiffness: 10000, damping: 20).repeatForever(autoreverses: false), value: moving)
            }
            
            // Ball 2
            HStack(spacing: 50) {
                Text("Low Stiffness: ")
                Image("ball")
                    .offset(x: moving ? 0 : 100)
                    // Low Stiffness: Try 100 to 200
                    .animation(.interpolatingSpring(stiffness: 200, damping: 14).repeatForever(autoreverses: false), value: moving)
            }
            
            // Ball 3
            HStack(spacing: 50) {
                Text("Medium Stiffness: ")
                Image("ball")
                    .offset(x: moving ? 0 : 100)
                    // Medium Stiffness
                    .animation(.interpolatingSpring(stiffness: 1500, damping: 12).repeatForever(autoreverses: false), value: moving)
            }
            
            // Ball 4
            HStack(spacing: 50) {
                Text("Very Low Stiffness: ")
                Image("ball")
                    .offset(x: moving ? 0 : 100)
                    // Ball 4: Very Low Stiffness
                    .animation(.interpolatingSpring(stiffness: 50, damping: 26).repeatForever(autoreverses: false), value: moving)
            }
        } // All balls
        .onAppear{
            moving.toggle()
        }
    }
}

struct StiffNessBounce_Previews: PreviewProvider {
    static var previews: some View {
        StiffNessBounce()
            .preferredColorScheme(.dark)
.previewInterfaceOrientation(.landscapeLeft)
    }
}
