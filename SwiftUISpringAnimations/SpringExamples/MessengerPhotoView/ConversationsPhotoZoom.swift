//
// ConversationsPhotoZoom.swift
//
//  Learning SwiftUI Spring Animations: The Basics and Beyond
//
//  Created by Amos from getstream.io


import SwiftUI

struct ConversationsPhotoZoom: View {
    
    @State private var zoomed = false
    @Namespace private var smooth
    @State private var tapped = false
    
    var body: some View {
        VStack {
            
            ConversationsHeader()
            
            Spacer()
           
            ZStack{
                if !tapped {
                    HStack {
                        PhotoMessageView()
                            .matchedGeometryEffect(id: "morph", in: smooth)
                        Spacer()
                    }
                } else {
                    Image("iceland4")
                        .resizable()
                        .matchedGeometryEffect(id: "morph", in: smooth)
                        .aspectRatio(contentMode: .fill)
                }
            }
            .onTapGesture {
                withAnimation(
                    .spring()
                    //.interactiveSpring()
                    //.spring(response: 0.3, dampingFraction: 0.825, blendDuration: 0)
                    //.interpolatingSpring(mass: 0.5, stiffness: 170, damping: 15, initialVelocity: 0)
                    //.interpolatingSpring(stiffness: 170, damping: 15)
                    //.interactiveSpring(response: 0.15, dampingFraction: 0.86, blendDuration: 0)
                ){
                    zoomed.toggle()
                    tapped.toggle()
                }
            }
           
            Spacer()
            
            ComposeArea()
            
        }
        .padding(.horizontal)
    }
    
    struct ConversationsPhotoZoom_Previews: PreviewProvider {
        static var previews: some View {
            ConversationsPhotoZoom()
                .preferredColorScheme(.dark)
        }
    }
}
