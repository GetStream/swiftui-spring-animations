//
//  ReactionsSpringsWithParameters.swift

//  Learning SwiftUI Spring Animations: The Basics and Beyond

//  Created by Amos from getstream.io
//

import SwiftUI

struct ReactionsSpringsWithParameters: View {
    // 1. Define initial animation state
    @State private var showReaction = false
    
    let inboundBubbleColor = Color(#colorLiteral(red: 0.07058823529, green: 0.07843137255, blue: 0.0862745098, alpha: 1))
    let reactionsBGColor = Color(#colorLiteral(red: 0.05490196078, green: 0.09019607843, blue: 0.137254902, alpha: 1))
    var body: some View {
        
            ZStack { // 1. Reactions background: .interpolatingSpring(stiffness: 170, damping: 15)
                RoundedRectangle(cornerRadius: 28)
                    .frame(width: 216, height: 40)
                    .foregroundColor(Color(.systemGray6))
                    .scaleEffect(CGFloat(showReaction ? 1 : 0), anchor: .topTrailing)
                    .animation(.interpolatingSpring(stiffness: 170, damping: 15).delay(0.05), value: showReaction)
                
                // 2. Heart icon: .interpolatingSpring(mass: Double = 1.0, stiffness: Double, damping: Double, initialVelocity: Double = 0.0)
                HStack(spacing: 20) {
                    Image("heart")
                        .offset(x: showReaction ? 0 : 2)
                        .scaleEffect(showReaction ? 1 : 0, anchor: .bottomLeading)
                        .animation(.interpolatingSpring(mass: 1, stiffness: 170, damping: 10, initialVelocity: 50).delay(0.1), value: showReaction)
                    
                    // 3. .spring(response: Double = 0.55, dampingFraction: Double = 0.825, blendDuration: Double = 0)
                    Image("thumbup")
                        .offset(x: showReaction ? 0 : -15)
                        .scaleEffect(showReaction ? 1 : 0, anchor: .bottom)
                        .rotationEffect(.degrees(showReaction ? 0 : -45))
                        .animation(.spring(response: 0.55, dampingFraction: 0.825/3, blendDuration: 0).delay(0.2), value: showReaction)
                    
                    // 4. .interactiveSpring(response: Double = 0.15, dampingFraction: Double = 0.86, blendDuration: Double = 0.25)
                    Image("thumbdown")
                        .scaleEffect(showReaction ? 1 : 0, anchor: .topTrailing)
                        .rotationEffect(.degrees(showReaction ? 0 : 45))
                        .animation(.interactiveSpring(response: 0.15*4, dampingFraction: 0.86/3, blendDuration: 0).delay(0.3), value: showReaction)
                    
                    Image("crying")
                        .scaleEffect(showReaction ? 1 : 0, anchor: .bottom)
                        .animation(.interpolatingSpring(stiffness: 170, damping: 8).delay(0.4), value: showReaction)
                    
                    Image("sad")
                        .offset(x: showReaction ? 0 : 15)
                        .scaleEffect(showReaction ? 1 : 0, anchor: .bottomTrailing)
                        .animation(.interpolatingSpring(stiffness: 170, damping: 8).delay(0.5), value: showReaction)
                    
                }
                
            } // All reaction views
            .onAppear{
                showReaction.toggle()
            }
    }
}

struct ReactionsSpringsWithParameters_Previews: PreviewProvider {
    static var previews: some View {
        ReactionsSpringsWithParameters()
            .preferredColorScheme(.dark)
    }
}

