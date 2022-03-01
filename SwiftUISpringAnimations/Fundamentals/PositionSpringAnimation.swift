//
//  PositionSpringAnimation.swift

//  Learning SwiftUI Spring Animations: The Basics and Beyond
//
//  Created by Amos from getstream.io
//

import SwiftUI

struct PositionSpringAnimation: View {
    
    // 1. Define an animation variable
    @State private var moving = false
    
    var body: some View {
        VStack {
            
            Text("Animate a ball's position so that it appears to be pulled towards a target by a spring.")
                .font(.title)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            Image("ball")
                .offset(x: moving ? 150 : -150)
            // 2. Add animation trigger
                .onAppear {
                    withAnimation(
                        .spring()
                        //.interactiveSpring()
                            .repeatForever(
                                autoreverses: false)){
                                    // Set final animation state
                                    moving.toggle()
                                }
                }
            
            HStack(spacing: 300) {
                Text("A")
                Text("B")
            }
            
            Spacer()
            
        }
        .padding()
    }
}

struct PositionSpringAnimation_Previews: PreviewProvider {
    static var previews: some View {
        PositionSpringAnimation()
            .preferredColorScheme(.dark)
    }
}
