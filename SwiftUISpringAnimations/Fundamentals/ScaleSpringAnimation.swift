//
//  ScaleSpringAnimation.swift

//  Learning SwiftUI Spring Animations: The Basics and Beyond
//
//  Created by Amos from getstream.io
//

import SwiftUI

struct  ScaleSpringAnimation: View {
    
    @State private var scaling = false
    
    var body: some View {
        VStack {
            
            Text("Create a spring animation that bounces a ball into view by animating its scale from 1 to 2.")
                .font(.title)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            Image("ball")
                .scaleEffect(scaling ? 2 : 1)
                .onAppear {
                    withAnimation(
                        .spring()
                        //.interactiveSpring()
                            .repeatForever(
                                autoreverses: false)) {
                            scaling.toggle()
                    }
                }
            
            Spacer()
            
        }
        .padding()
    }
}

struct  ScaleSpringAnimation_Previews: PreviewProvider {
    static var previews: some View {
        ScaleSpringAnimation()
            .preferredColorScheme(.dark)
    }
}
