//
//  SilentModeOff.swift
//  SwiftUI Spring Animations

//  Silent mode off: Animate a slashed bell to fall and rotate after falling

//  Created by Amos from getstream.io
//

import SwiftUI

struct SilentModeOff: View {
    
    @State private var showing = true
    @State private var rotating = false
    
    var body: some View {
        HStack {
            Image(systemName: "bell.slash.fill")
                .font(.largeTitle)
                .mask(Rectangle().offset(y: rotating ? 0 : 40 ))
                .rotationEffect(.degrees(rotating ? 0 : -45), anchor: .top)
                .animation(.interpolatingSpring(mass: 1, stiffness: 170, damping: 15, initialVelocity: 4).repeatCount(1, autoreverses: true).delay(2.25), value: rotating)
                //.animation(.interactiveSpring(response: 0.25, dampingFraction: 0.86/2, blendDuration: 0.25).repeatCount(1, autoreverses: true).delay(2.25), value: rotating)
                //.animation(.interpolatingSpring(stiffness: 120, damping: 15).repeatCount(1, autoreverses: true).delay(2.25), value: rotating)
                //.animation(.spring(response: 0.55, dampingFraction: 0.825, blendDuration: 0).repeatCount(1, autoreverses: true).delay(2.25), value: rotating)
            
            VStack {
                Text("Silent mode")
                Text("Off")
            }
        }
        .padding(EdgeInsets(top: 4, leading: 16, bottom: 4, trailing: 16))
        .background(Color(.systemGray4))
        .cornerRadius(32)
        .offset(y: showing ? -UIScreen.main.bounds.height/1.8 : -UIScreen.main.bounds.height/2.5)
        .onAppear {
            
            rotating.toggle()
            
            withAnimation(.spring().repeatCount(1, autoreverses: true).delay(2)) {
                showing.toggle()
            }
        }
    }
}

struct SilentModeOff_Previews: PreviewProvider {
    static var previews: some View {
        SilentModeOff()
            .preferredColorScheme(.dark)
    }
}
