//
//  SilentModeOff.swift
//  AnimateWithSprings
//
//  Created by Amos Gyamfi on 24.12.2024.
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
                .animation(.interpolatingSpring(mass: 1, stiffness: 170, damping: 15, initialVelocity: 4).repeatCount(1, autoreverses: true).delay(0.25), value: rotating)
            
            VStack {
                Text("Silent Mode")
                Text("Off")
            }
        }
        .padding(EdgeInsets(top: 4, leading: 16, bottom: 4, trailing: 16))
        .background(Color(.systemGray4))
        .cornerRadius(32)
        .offset(y: showing ? -UIScreen.main.bounds.height/1.5 : -UIScreen.main.bounds.height/2.5)
        .onAppear {
            
            rotating.toggle()
            
            withAnimation(.snappy()) {
                showing.toggle()
            }
        }
    }
}

#Preview {
    SilentModeOff()
        .preferredColorScheme(.dark)
}
