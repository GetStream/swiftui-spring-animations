//
//  DockStyleBounce.swift
//  SwiftUISpringAnimations
//
//  Learning SwiftUI Spring Animations: The Basics and Beyond
//
//  Created by Amos from getstream.io

import SwiftUI

struct DockStyleBounce: View {
    
    @State private var isBouncing = false
    
    var body: some View {
        VStack {
            Text("Bounce Effect")
            
            Image("ball")
                .offset(y: isBouncing ? 0 : -90)
                //.animation(.spring(response: 0.55/2, dampingFraction: 0.825/2, blendDuration: 0).delay(1).repeatForever(autoreverses: false), value: isBouncing)
                //.animation(.interpolatingSpring(mass: 0.5, stiffness: 600, damping: 5, initialVelocity: 0).delay(1).repeatForever(autoreverses: false), value: isBouncing)
                .animation(.interactiveSpring(response: 0.25, dampingFraction: 0.25, blendDuration: 0).delay(1).repeatForever(autoreverses: false), value: isBouncing)
                .onAppear{
                    isBouncing.toggle()
                }
        }
    }
}

struct DockStyleBounce_Previews: PreviewProvider {
    static var previews: some View {
        DockStyleBounce()
            .preferredColorScheme(.dark)
    }
}
