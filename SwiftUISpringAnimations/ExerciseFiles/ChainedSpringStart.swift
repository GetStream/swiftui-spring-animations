//
//  ChainedSpringStart.swift

//  Learning SwiftUI Spring Animations: The Basics and Beyond
//  Hint: Apply a different delay to each oval the achieve this spring effect.
//
//  Created by Amos from getstream.io
//

import SwiftUI

struct ChainedSpringStart: View {
    
    // 1. Define initial animation state
    @State var moving = false
    
    var body: some View {
        ZStack{
            Circle() // One
                .stroke(lineWidth: 5)
                .frame(width: 20, height: 20)
                .rotation3DEffect(.degrees(75), axis: (x: 1 , y: 0, z: 0))
                .offset(y: moving ? 150 : -180)
                .animation(.interpolatingSpring(stiffness: 100, damping: 5).repeatForever(autoreverses: true), value: moving)
                // 3. Add the property you want to animate
                // 4. Add animation type
            
            Circle()  // Two
                .stroke(lineWidth: 5)
                .frame(width: 50, height: 50)
                .rotation3DEffect(.degrees(75), axis: (x: 1 , y: 0, z: 0))
                .offset(y: moving ? 150 : -180)
                .animation(.interpolatingSpring(stiffness: 100, damping: 5).repeatForever(autoreverses: true).delay(0.05), value: moving)
                
            Circle()  // Three
                .stroke(lineWidth: 5)
                .frame(width: 80, height: 80)
                .rotation3DEffect(.degrees(75), axis: (x: 1 , y: 0, z: 0))
                .offset(y: moving ? 150 : -180)
                .animation(.interpolatingSpring(stiffness: 100, damping: 5).repeatForever(autoreverses: true).delay(0.1), value: moving)
            
            Circle()  // Four
                .stroke(lineWidth: 5)
                .frame(width: 110, height: 110)
                .rotation3DEffect(.degrees(75), axis: (x: 1 , y: 0, z: 0))
                .offset(y: moving ? 150 : -180)
                .animation(.interpolatingSpring(stiffness: 100, damping: 5).repeatForever(autoreverses: true).delay(0.15), value: moving)
                
            
            Circle()  // Five
                .stroke(lineWidth: 5)
                .frame(width: 140, height: 140)
                .rotation3DEffect(.degrees(75), axis: (x: 1 , y: 0, z: 0))
                .offset(y: moving ? 150 : -180)
                .animation(.interpolatingSpring(stiffness: 100, damping: 5).repeatForever(autoreverses: true).delay(0.2), value: moving)
                
            
            Circle()  // Six
                .stroke(lineWidth: 5)
                .frame(width: 170, height: 170)
                .rotation3DEffect(.degrees(75), axis: (x: 1 , y: 0, z: 0))
                .offset(y: moving ? 150 : -180)
                .animation(.interpolatingSpring(stiffness: 100, damping: 5).repeatForever(autoreverses: true).delay(0.25), value: moving)
                
            Circle()  // Seven
                .stroke(lineWidth: 5)
                .frame(width: 200, height: 200)
                .rotation3DEffect(.degrees(75), axis: (x: 1 , y: 0, z: 0))
                .offset(y: moving ? 150 : -180)
                .animation(.interpolatingSpring(stiffness: 100, damping: 5).repeatForever(autoreverses: true).delay(0.3), value: moving)
                
            Circle()  // Eight
                .stroke(lineWidth: 5)
                .frame(width: 230, height: 230)
                .rotation3DEffect(.degrees(75), axis: (x: 1 , y: 0, z: 0))
                .offset(y: moving ? 150 : -180)
                .animation(.interpolatingSpring(stiffness: 100, damping: 5).repeatForever(autoreverses: true).delay(0.35), value: moving)
        }
        .onAppear{
            moving.toggle()
        }
        // Circles container
        // 2. Specify how the animation will be triggered
        
    }
    
}

struct ChainedSpringStart_Previews: PreviewProvider {
    static var previews: some View {
        ChainedSpringStart()
            .preferredColorScheme(.dark)
    }
}
