//
//  PhotoZoom.swift
//  SwiftUISpringAnimations
//
//  Created by amos.gyamfi@getstream.io on 25.2.2022.
//
//  A simple photozoom

import SwiftUI

struct PhotoZoom: View {
    
    @State private var zoomed = false
    @Namespace private var smooth
    
    var body: some View {
        ZStack {
            if !zoomed {
                Image("iceland4")
                    .resizable()
                    .matchedGeometryEffect(id: "morph", in: smooth)
                    .aspectRatio(contentMode: .fit)
            } else {
                ZStack {
                    Image("iceland4")
                        .resizable()
                        .matchedGeometryEffect(id: "morph", in: smooth)
                        .ignoresSafeArea()
                    
                    Text("Iceland")
                        .font(.largeTitle)
                        .textCase(.uppercase)
                }
            }
        } // Both images
        .onTapGesture{
            withAnimation(.interpolatingSpring(mass: 1, stiffness: 170, damping: 15, initialVelocity: 0)){
                zoomed.toggle()
            }
        }
    }
}

struct PhotoZoom_Previews: PreviewProvider {
    static var previews: some View {
        PhotoZoom()
            .preferredColorScheme(.dark)
    }
}
