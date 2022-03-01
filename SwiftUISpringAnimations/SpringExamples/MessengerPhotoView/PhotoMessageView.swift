//
//  PhotoMessageView.swift
//
//  Learning SwiftUI Spring Animations: The Basics and Beyond
//
//  Created by Amos from getstream.io


import SwiftUI

struct PhotoMessageView: View {
    var body: some View {
        HStack(alignment: .bottom) {
            Image("fra")
                .resizable()
                .frame(width: 32, height: 32)
                .clipShape(Circle())
            VStack(alignment: .leading, spacing: 2) {
                ZStack(alignment: .bottomLeading) {
                    RoundedRectangle(cornerRadius: 0)
                        .fill(Color(.systemGray6))
                        .frame(width: 16, height: 36/2)
                    
                    RoundedRectangle(cornerRadius: 18)
                        .fill(Color(.systemGray6))
                        .frame(width: 171, height: 36)
                        .overlay(Text("Hi Amos, its Fra!!!"))
                }
                
                HStack {
                    Image("iceland4")
                        .resizable()
                        .frame(width: 180, height:180)
                        .cornerRadius(16)
                    
                    Image(systemName: "square.and.arrow.up")
                }
            } // Consecutive message
        }
    }
}

struct PhotoMessageView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoMessageView()
            .preferredColorScheme(.dark)
    }
}
