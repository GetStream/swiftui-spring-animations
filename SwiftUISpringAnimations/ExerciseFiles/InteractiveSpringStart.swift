//
//  InteractiveSpringStart.swift
//  hamburger_to_close

//  Using an interactive spring. An interactive spring with no parameters.

//  This creates a spring animation with a high stiffness and a low response. It creates a spring animation that is less snappy:

//  Created by Amos from getstream.io
//

import SwiftUI

struct InteractiveSpringStart: View {
    
    @State private var isRotating = false
    @State private var isHidden = false
    
    var body: some View {
        VStack(spacing: 14){
            
            Rectangle() // top
                .frame(width: 64, height: 10)
                .cornerRadius(4)
                .rotationEffect(.degrees(isRotating ? 48 : 0), anchor: .leading)
            
            Rectangle() // middle
                .frame(width: 64, height: 10)
                .cornerRadius(4)
                .scaleEffect(isHidden ? 0 : 1, anchor: isHidden ? .trailing: .leading)
                .opacity(isHidden ? 0 : 1)
            
            Rectangle() // bottom
                .frame(width: 64, height: 10)
                .cornerRadius(4)
                .rotationEffect(.degrees(isRotating ? -48 : 0), anchor: .leading)
        }
        .onTapGesture {
            // Spring 2: Pass an interactive spring here. Makes the animations less snappy because of its high stiffness and low response.
            withAnimation(.interactiveSpring()){
                isRotating.toggle()
                isHidden.toggle()
            }
        }
        
    }
}

struct InteractiveSpringStart_Previews: PreviewProvider {
    static var previews: some View {
        InteractiveSpringStart()
            .preferredColorScheme(.dark)
    }
}
