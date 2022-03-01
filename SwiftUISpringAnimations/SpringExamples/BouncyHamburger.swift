//
//  BouncyHamburger.swift
//  Hamburger to Close
//
//  Learning SwiftUI Spring Animations: The Basics and Beyond

//  Create a bouncy hamburger menu to close icon transition

//  Created by Amos from getstream.io

import SwiftUI

struct BouncyHamburger: View {
    
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
            withAnimation(.interpolatingSpring(stiffness: 300, damping: 15)){
                isRotating.toggle()
                isHidden.toggle()
            }
        }
        
    }
}

struct BouncyHamburger_Previews: PreviewProvider {
    static var previews: some View {
        BouncyHamburger()
            .preferredColorScheme(.dark)
    }
}
