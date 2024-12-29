//
//  ReactionsView.swift

import SwiftUI

struct ReactionsView: View {
    @State private var heartCount = 0
    @State private var thumbsUpCount = 0
    @State private var thumbsDownCount = 0
    @State private var cryCount = 0
    @State private var sadCount = 0
    @State private var isLoved = false
    @State private var isLiked = false
    
    // 1. Define initial animation states
    // For reactions background
    @State private var showReactionsBG = 0
    
    // For thumbsup icon
    @State private var showThumbsUp = 0
    @State private var rotateThumb = -45
    
    
    // For heart icon
    @State private var showHeart = 0
    
    // For thumbsdown
    @State private var showThumbsDown = 0
    
    // For LOL
    @State private var showCrying = 0
    
    // For ?!
    @State private var showSad = 0
    
    
    let inboundBubbleColor = Color(#colorLiteral(red: 0.07058823529, green: 0.07843137255, blue: 0.0862745098, alpha: 1))
    let reactionsBGColor = Color(#colorLiteral(red: 0.05490196078, green: 0.09019607843, blue: 0.137254902, alpha: 1))
    var body: some View {
        
        ZStack { // Reactions background
            RoundedRectangle(cornerRadius: 28)
                .frame(width: 400, height: 48)
                .foregroundStyle(.quinary)
            // 3. Add property to animate
                .scaleEffect(CGFloat(showReactionsBG), anchor: .topTrailing)
            // 4. Add animation modifier
                .animation(.interpolatingSpring(stiffness: 170, damping: 15).delay(0.05), value: showReactionsBG)
            
            // Reaction icons
            HStack(spacing: 32) {
                
                Button {
                    heartCount += 1
                    
                    withAnimation(.interpolatingSpring(stiffness: 170, damping: 5)) {
                        isLoved.toggle()
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.45) {
                        withAnimation(.interpolatingSpring(stiffness: 170, damping: 10)) {
                            isLoved = false
                        }
                    }
                } label: {
                    ZStack {
                        SplashView()
                            .opacity(isLoved ? 0 : 1)
                            .animation(.easeInOut(duration: 0.5).delay(0.25), value: isLoved)
                            .scaleEffect(isLoved ? 1.25 : 0)
                            .animation(.easeInOut(duration: 0.5), value: isLoved)
                        SplashView()
                            .rotationEffect(.degrees(90))
                            .opacity(isLoved ? 0 : 1)
                            .offset(y: isLoved ? 6 : -6)
                            .animation(.easeInOut(duration: 0.5).delay(0.2), value: isLoved)
                            .scaleEffect(isLoved ? 1.25 : 0)
                            .animation(.easeOut(duration: 0.5), value: isLoved)
                        
                        Image(.heart)
                            .phaseAnimator([false, true], trigger: heartCount) { icon, scaleFromBottom in
                                icon
                                    .scaleEffect(scaleFromBottom ? 1.5 : 1, anchor: .bottom)
                            } animation: { scaleFromBottom in
                                    .bouncy(duration: 0.4, extraBounce: 0.4)
                            }
                            .scaleEffect(CGFloat(showHeart))
                        
                        Circle()
                            .strokeBorder(lineWidth: isLoved ? 0 : 32)
                            .animation(.easeInOut(duration: 0.5).delay(0.1),value: isLoved)
                            .frame(width: 70, height: 70)
                            .foregroundColor(Color(.systemPink))
                            .hueRotation(.degrees(isLoved ? 300 : 200))
                            .scaleEffect(isLoved ? 1.15 : 0)
                            .animation(.easeInOut(duration: 0.5), value: isLoved)
                    }
                }
                
                Button {
                    thumbsUpCount += 1
                    
                    withAnimation(.interpolatingSpring(stiffness: 170, damping: 5)) {
                        isLiked.toggle()
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.45) {
                        withAnimation(.interpolatingSpring(stiffness: 170, damping: 10)) {
                            isLiked = false
                        }
                    }
                } label: {
                    ZStack {
                        Circle()
                            .strokeBorder(lineWidth: isLiked ? 0 : 32)
                            .animation(.easeInOut(duration: 0.5).delay(0.1),value: isLiked)
                            .frame(width: 70, height: 70)
                            .foregroundColor(Color(.systemPink))
                            .hueRotation(.degrees(isLiked ? 300 : 200))
                            .scaleEffect(isLiked ? 1.15 : 0)
                            .animation(.easeInOut(duration: 0.5), value: isLiked)
                        
                        SplashView()
                            .opacity(isLiked ? 0 : 1)
                            .animation(.easeInOut(duration: 0.5).delay(0.25), value: isLiked)
                            .scaleEffect(isLiked ? 1.25 : 0)
                            .animation(.easeInOut(duration: 0.5), value: isLiked)
                        
                        SplashView()
                            .rotationEffect(.degrees(90))
                            .opacity(isLiked ? 0 : 1)
                            .offset(y: isLiked ? 6 : -6)
                            .animation(.easeInOut(duration: 0.5).delay(0.2), value: isLiked)
                            .scaleEffect(isLiked ? 1.25 : 0)
                            .animation(.easeOut(duration: 0.5), value: isLiked)
                        
                        Image(.thumbup)
                            .phaseAnimator([false, true], trigger: thumbsUpCount) { icon, scaleRotate in
                                icon
                                    .rotationEffect(.degrees(scaleRotate ? -45 : 0), anchor: .bottomLeading)
                                    .scaleEffect(scaleRotate ? 1.5 : 1)
                            } animation: { scaleRotate in
                                    .bouncy(duration: 0.4, extraBounce: 0.4)
                            }
                            .scaleEffect(CGFloat(showThumbsUp))
                            .rotationEffect(.degrees(Double(rotateThumb)))
                    }
                }
                
                
                Button {
                    thumbsDownCount += 1
                } label: {
                    Image("thumbdown")
                }
                .phaseAnimator([false, true], trigger: thumbsDownCount) { icon, dislike in
                    icon
                        .rotationEffect(.degrees(dislike ? -45 : 0), anchor: .leading)
                        .scaleEffect(dislike ? 1.5 : 1)
                } animation: { dislike in
                        .bouncy(duration: 0.2, extraBounce: 0.4)
                }
                .scaleEffect(CGFloat(showThumbsDown))
                .rotationEffect(.degrees(Double(rotateThumb)))
                .frame(width: 44)
                
                Button {
                    cryCount += 1
                } label: {
                    Image("crying")
                }
                .phaseAnimator([false, true], trigger: cryCount) { icon, crying in
                    icon
                        .offset(y: crying ? -30 : 0)
                        .scaleEffect(crying ? 1.5 : 1)
                } animation: { crying in
                        .bouncy(duration: 0.2, extraBounce: 0.4)
                }
                .scaleEffect(CGFloat(showThumbsDown))
                .rotationEffect(.degrees(Double(rotateThumb)))
                .frame(width: 44)
                
                Button {
                    sadCount += 1
                } label: {
                    Image("sad")
                }
                .phaseAnimator([false, true], trigger: sadCount) { icon, sad in
                    icon
                        .offset(y: sad ? -30 : 0)
                        .rotationEffect(.degrees(sad ? 45 : 0))
                        .scaleEffect(sad ? 1.5 : 1)
                } animation: { sad in
                        .bouncy(duration: 0.2, extraBounce: 0.4)
                }
                .scaleEffect(CGFloat(showThumbsDown))
                .rotationEffect(.degrees(Double(rotateThumb)))
                .frame(width: 44)
                
            }
            
        } // All reaction views
        .onAppear {
            withAnimation(.interpolatingSpring(stiffness: 170, damping: 15).delay(0.05))
            {
                showReactionsBG = 1
            }
            
            withAnimation(.interpolatingSpring(stiffness: 170, damping: 8).delay(0.1))
            {
                showHeart = 1
            }
            
            withAnimation(.interpolatingSpring(stiffness: 170, damping: 8).delay(0.2))
            {
                showThumbsUp = 1
                rotateThumb = 0
            }
            
            withAnimation(.interpolatingSpring(stiffness: 170, damping: 8).delay(0.3))
            {
                showThumbsDown = 1
                rotateThumb = 0
            }
            
            withAnimation(.interpolatingSpring(stiffness: 170, damping: 8).delay(0.4))
            {
                showCrying = 1
            }
            
            withAnimation(.interpolatingSpring(stiffness: 170, damping: 8).delay(0.5))
            {
                showSad = 1
            }
        }
    }
}

#Preview {
    ReactionsView()
        .preferredColorScheme(.dark)
}
