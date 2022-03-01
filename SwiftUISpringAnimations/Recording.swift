//
//  Recording.swift

//  SwiftUI Spring Animation demonstrating .spring(response, dampingFraction, blendDuration) and .interactiveSpring(response, dampingFraction, blendDuration,)
//
//  Created by Amos from @getstream.io

import SwiftUI

struct Recording: View {
    
    let maraschino = Color(#colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1))
    @State private var recording = false
    
    var body: some View {
        ZStack {
            // stroked circle
            Circle()
                .stroke(lineWidth: recording ? 4 : 0)
                // .spring()
                .animation(.spring(), value: recording)
                .frame(width: 240, height: 240)
                .foregroundStyle(Color(.systemGray6))
                .scaleEffect(recording ? 1 : 0.5)
                // .interactiveSpring(response: Double = 0.15, dampingFraction: Double = 0.86, blendDuration: Double = 0.25)
                .animation(.interactiveSpring(response: 0.15, dampingFraction: 0.86, blendDuration: 0.25).repeatForever(autoreverses: false), value: recording)
            
            // Middle
            Circle()
                .frame(width: 160, height: 160)
                .foregroundStyle(Color(.systemGray))
                .scaleEffect(recording ? 1 : 0.5)
                .opacity(recording ? 0.6 : 0)
            
            // Maraschino
            Circle()
                .frame(width: 80, height: 80)
                .scaleEffect(recording ? 0.8 : 1)
                .foregroundStyle(maraschino)
                .overlay(Image(systemName: "mic.fill").font(.largeTitle))
        }
        // .spring(response = 0.55, dampingFraction = 0.825, blendDuration = 0)
        .onAppear {
            withAnimation(.spring(response: 0.55, dampingFraction: 0.825, blendDuration: 0).repeatForever(autoreverses: true)) {
                    recording.toggle()
            }
        }
    }
}

struct Recording_Previews: PreviewProvider {
    static var previews: some View {
        Recording()
            .preferredColorScheme(.dark)
    }
}
