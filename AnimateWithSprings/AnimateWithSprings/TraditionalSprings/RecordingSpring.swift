//
//  RecordingSpring.swift
//  AnimateWithSprings
//
//  Created by Amos Gyamfi on 24.12.2024.
//

import SwiftUI

struct RecordingSpring: View {
    
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
                .animation(.interactiveSpring(response: 0.15, dampingFraction: 0.86, blendDuration: 0.25).repeatForever(autoreverses: false), value: recording)
            Circle()
                .frame(width: 160, height: 160)
                .foregroundStyle(Color(.systemGray))
                .scaleEffect(recording ? 1 : 0.5)
                .opacity(recording ? 0.6 : 0)
            Circle()
                .frame(width: 80, height: 80)
                .scaleEffect(recording ? 0.8 : 1)
                .foregroundStyle(maraschino)
                .overlay(Image(systemName: "mic.fill").font(.largeTitle))
        }
        .onAppear {
            withAnimation(.spring(response: 0.55, dampingFraction: 0.825, blendDuration: 0).repeatForever(autoreverses: true)) {
                    recording.toggle()
            }
        }
    }
}

#Preview {
    RecordingSpring()
        .preferredColorScheme(.dark)
}
