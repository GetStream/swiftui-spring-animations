//
//  BackAndForthBouncingLoader.swift
//  SwiftUISpringAnimations
//
//  Learning SwiftUI Spring Animations: The Basics and Beyond
//
//  Created by Amos from getstream.io

import SwiftUI

struct BackAndForthBouncingLoader: View {
    
    @State private var isBouncing = false
    
    var body: some View {
        
        
        HStack(spacing: -30) {
            Image("ball")
                .scaleEffect(0.2)
                .offset(y: isBouncing ? 0 : -30)
                .animation(.interactiveSpring(response: 0.5, dampingFraction: 0.55, blendDuration: 0).repeatForever(autoreverses: true).delay(0.05), value: isBouncing)
            
            Image("ball")
                .scaleEffect(0.2)
                .offset(y: isBouncing ? 0 : -30)
                .animation(.interactiveSpring(response: 0.5, dampingFraction: 0.55, blendDuration: 0).repeatForever(autoreverses: true).delay(0.1), value: isBouncing)
            
            Image("ball")
                .scaleEffect(0.2)
                .offset(y: isBouncing ? 0 : -30)
                .animation(.interactiveSpring(response: 0.5, dampingFraction: 0.55, blendDuration: 0).repeatForever(autoreverses: true).delay(0.15), value: isBouncing)
        }
        .onAppear{
            isBouncing.toggle()
        }
        
    }
}

struct BackAndForthBouncingLoader_Previews: PreviewProvider {
    static var previews: some View {
        BackAndForthBouncingLoader()
            .preferredColorScheme(.dark)
    }
}
