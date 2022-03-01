//
//  ReactionsView.swift

//  Learning SwiftUI Spring Animations: The Basics and Beyond

//  Created by Amos from getstream.io
//

import SwiftUI

struct ReactionsView: View {
    // 1. Define initial animation state
    @State private var showReaction = false
    
    let inboundBubbleColor = Color(#colorLiteral(red: 0.07058823529, green: 0.07843137255, blue: 0.0862745098, alpha: 1))
    let reactionsBGColor = Color(#colorLiteral(red: 0.05490196078, green: 0.09019607843, blue: 0.137254902, alpha: 1))
    var body: some View {
        
            ZStack { // Reactions background
                RoundedRectangle(cornerRadius: 28)
                    .frame(width: 216, height: 40)
                    .foregroundColor(Color(.systemGray6))
                
                // 3. Add property to animate
                    .scaleEffect(CGFloat(showReaction ? 1 : 0), anchor: .topTrailing)
                // 4. Add animation modifier
                    .animation(.interpolatingSpring(stiffness: 170, damping: 15).delay(0.05), value: showReaction)
                
                // Reaction icons
                HStack(spacing: 20) {
                    Image("heart")
                        .offset(x: showReaction ? 0 : -15)
                        .scaleEffect(showReaction ? 1 : 0, anchor: .bottomLeading)
                        .animation(.interpolatingSpring(stiffness: 170, damping: 8).delay(0.1), value: showReaction)
                    
                    Image("thumbup")
                        .offset(x: showReaction ? 0 : -15)
                        .scaleEffect(showReaction ? 1 : 0, anchor: .bottom)
                        .rotationEffect(.degrees(showReaction ? 0 : -45))
                        .animation(.interpolatingSpring(stiffness: 170, damping: 8).delay(0.2), value: showReaction)
                    
                    Image("thumbdown")
                        .scaleEffect(showReaction ? 1 : 0, anchor: .topTrailing)
                        .rotationEffect(.degrees(showReaction ? 0 : 45))
                        .animation(.interpolatingSpring(stiffness: 170, damping: 8).delay(0.3), value: showReaction)
                    
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

struct ReactionsView_Previews: PreviewProvider {
    static var previews: some View {
        ReactionsView()
            .preferredColorScheme(.dark)
    }
}

