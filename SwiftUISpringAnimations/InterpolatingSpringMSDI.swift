//
//  InterpolatingSpringMSDI.swift
//
//  Learning SwiftUI Spring Animations: The Basics and Beyond
//
//  Created by Amos from getstream.io

import SwiftUI

struct InterpolatingSpringMSDI: View {
    
    @State private var transformAndRest = false
    @State private var moveBack = true
    @State private var reactionIcon = Image(uiImage: #imageLiteral(resourceName: "love"))
    
    @State private var longPressed = false
    
    var body: some View {
        VStack {
            
            if longPressed {
                ReactionsView()
            } else {
                EmptyView()
            }
            
            HStack(alignment: .bottom) {
                Image("fra")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .clipShape(Circle())
                
                // Chat bubble
                ZStack(alignment: .bottomTrailing) {
                    RoundedRectangle(cornerRadius: 18)
                        .fill(Color(.systemGray6))
                        .frame(width: 171, height: 36)
                        .overlay(Text("Hi Amos, its Fra!!!"))
                        .onTapGesture(count: 2) {
                            // mass = 1, stiffness, damping, initial velocity = 0
                            withAnimation(.interpolatingSpring(mass: 1, stiffness: 170, damping: 15, initialVelocity: 0).repeatCount(1, autoreverses: true)) {
                                transformAndRest = true
                                reactionIcon = Image("thumbsup")
                            }
                            
                            withAnimation(.interpolatingSpring(stiffness: 170, damping: 15).delay(1)) {
                                moveBack = false
                            }
                        }   // Use tap and hold gesture to reveal the reactions
                        .onLongPressGesture{
                            longPressed = true
                        }
                    
                    // Reactions background
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(.systemGray6))
                        .frame(width: 30, height: 24)
                    //.shadow(color: .black, radius: 10, x: 0, y: -4)
                        .offset(y: 16)
                        .overlay(
                            // Reactions border
                            ZStack {
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(lineWidth: 2)
                                    .foregroundColor(.black)
                                    .frame(width: 30, height: 24)
                                    .shadow(color: .black, radius: 10, x: 0, y: -5)
                                    .offset(y: 16)
                                
                                reactionIcon
                                    .scaleEffect(transformAndRest ? 2.5 : 1)
                                    .scaleEffect(moveBack ? 1 : 0.35)
                                    .offset(y: transformAndRest ? -25 : 17)
                                    .offset(y: moveBack ? 0 : 40)
                            })
                }
            }
        }
    }
}


struct InterpolatingSpringMSDI_Previews: PreviewProvider {
    static var previews: some View {
        InterpolatingSpringMSDI()
            .preferredColorScheme(.dark)
    }
}
