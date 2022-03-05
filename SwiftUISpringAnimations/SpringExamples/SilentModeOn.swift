//
//  SilentModeOn.swift
//  SwiftUI Spring Animations

//  Animate a bell to fall and rotate after falling

//  Created by Amos from getstream.io
//

import SwiftUI

struct SilentModeOn: View {
    
    @State private var showing = true
    @State private var rotating = false
    
    var body: some View {
        HStack {
            Image(systemName: "bell.fill")
                .font(.largeTitle)
                .rotationEffect(.degrees(rotating ? 0 : -45), anchor: .top)
                .animation(.spring(response: 0.2, dampingFraction: 0.825/4, blendDuration: 0).repeatCount(1, autoreverses: true).delay(2.25), value: rotating)
            
            VStack {
                Text("Silent mode")
                Text("On")
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

struct SilentModeOn_Previews: PreviewProvider {
    static var previews: some View {
        SilentModeOn()
            .preferredColorScheme(.dark)
    }
}
