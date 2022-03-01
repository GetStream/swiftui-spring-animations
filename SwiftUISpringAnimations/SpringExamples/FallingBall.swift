//
//  FallingBall.swift
//  Learning SwiftUI Spring Animations: The Basics and Beyond
//
//  Created by Amos from getstream.io
//

import SwiftUI

struct FallingBall: View {
    
    @State private var moving = -60
    
    var body: some View {
        VStack {
            
            Text("A ball falling with bounce")
                .font(.title)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            ZStack {
                
                Image("down")
                Image("ball")
                    .offset(y: CGFloat(moving))
                    .onAppear(){
                        withAnimation(.spring(response:  0.25, dampingFraction: 0.3, blendDuration: 0).delay(1).repeatForever(autoreverses: false)){
                            moving = 10
                        }
                    }
                
                Image("top")
                    .offset(x: 3)
            }
            .scaleEffect(2)
            
            Spacer()
            
        }
    }
}

struct FallingBall_Previews: PreviewProvider {
    static var previews: some View {
        FallingBall()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        
    }
}
