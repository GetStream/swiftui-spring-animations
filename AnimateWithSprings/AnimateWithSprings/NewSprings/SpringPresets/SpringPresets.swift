//
//  SpringPresets.swift
//  AnimateWithSprings
//
//  Created by Amos Gyamfi on 28.12.2024.
//

import SwiftUI

struct SpringPresets: View {
    var body: some View {
        VStack(spacing: 120) {
            VStack(alignment: .leading) {
                Text("Bouncy")
                BouncyPreset()
            }
            
            VStack(alignment: .leading) {
                Text("Smooth")
                SmoothPreset()
            }
            
            VStack(alignment: .leading) {
                Text("Snappy")
                SnappyPreset()
            }
        }
        .scaleEffect(0.5)
    }
}

#Preview {
    SpringPresets()
        .preferredColorScheme(.dark)
}
