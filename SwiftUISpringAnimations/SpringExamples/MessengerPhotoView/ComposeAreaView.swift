//
//  ComposeArea.swift
//  Learning SwiftUI Spring Animations: The Basics and Beyond
//
//  Created by Amos from getstream.io
//

import SwiftUI

struct ComposeArea: View {
    
    @State private var compose = ""
    let accentPrimary = Color(#colorLiteral(red: 0.03921568627, green: 0.5176470588, blue: 1, alpha: 1))
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "plus.circle.fill")
                Image(systemName: "camera.fill")
                Image(systemName: "photo")
                Image(systemName: "mic.fill")
            }
            .foregroundStyle(
                .linearGradient(colors: [.purple, .blue], startPoint: .top, endPoint: .bottom))
            
           
            ZStack(alignment: .trailing) {
                TextField("Aa", text: $compose)
                    .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 4))
                    .frame(width: 150, height: 36)
                    .background(Color(.systemGray6))
                .cornerRadius(18)
                
                Image(systemName: "face.smiling.fill")
                    .padding(.trailing, 8)
            }
            
            Image(systemName: "hand.thumbsup.fill")
        }
        .foregroundColor(accentPrimary)
       
    }
}

struct ComposeArea_Previews: PreviewProvider {
    static var previews: some View {
        ComposeArea()
            .preferredColorScheme(.dark)
    }
}
