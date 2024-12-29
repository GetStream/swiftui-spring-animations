//
//  HeartAndThumbBurst.swift

import SwiftUI

struct HeartAndThumbBurst: View {
    @State private var scaleRotate = false
    @State private var isLiked = false
    @State private var isLoved = false
    
    var body: some View {
        HStack {
            Button {
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
                    Circle()
                        .strokeBorder(lineWidth: isLoved ? 0 : 32)
                        .animation(.easeInOut(duration: 0.5).delay(0.1),value: isLoved)
                        .frame(width: 70, height: 70)
                        .foregroundStyle(.pink)
                        .hueRotation(.degrees(isLoved ? 300 : 200))
                        .scaleEffect(isLoved ? 1.15 : 0)
                        .animation(.easeInOut(duration: 0.5), value: isLoved)
                    
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
                        .scaleEffect(isLoved ? 1.5 : 1, anchor: isLoved ? .bottom : .top)
                }
            }
            Button {
                withAnimation(.interpolatingSpring(stiffness: 170, damping: 10)) {
                    scaleRotate.toggle()
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.45) {
                    withAnimation(.interpolatingSpring(stiffness: 170, damping: 10)) {
                        scaleRotate = false
                    }
                }
                
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
                        .frame(width: 45, height: 45)
                        .foregroundColor(Color(.systemPink))
                        .hueRotation(.degrees(isLiked ? 300 : 200))
                        .scaleEffect(isLiked ? 1.3 : 0)
                        .animation(.easeInOut(duration: 0.5), value: isLiked)
                    
                    SplashView()
                        .opacity(isLiked ? 0 : 1)
                        .animation(.easeInOut(duration: 0.5).delay(0.25), value: isLiked)
                        .scaleEffect(isLiked ? 1.5 : 0)
                        .animation(.easeInOut(duration: 0.5), value: isLiked)
                    
                    SplashView()
                        .rotationEffect(.degrees(90))
                        .opacity(isLiked ? 0 : 1)
                        .offset(y: isLiked ? 6 : -6)
                        .animation(.easeInOut(duration: 0.5).delay(0.2), value: isLiked)
                        .scaleEffect(isLiked ? 1.5 : 0)
                        .animation(.easeOut(duration: 0.5), value: isLiked)
                    
                    Image(.thumbup)
                        .rotationEffect(.degrees(scaleRotate ? -45 : 0), anchor: .bottomLeading)
                        .scaleEffect(scaleRotate ? 1.5 : 1)
                }
            }
        }
    }
}

#Preview {
    HeartAndThumbBurst()
        .preferredColorScheme(.dark)
}
