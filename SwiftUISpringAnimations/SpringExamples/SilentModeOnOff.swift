//
//  SilentModeOnOff.swift
//  SwiftUISpringAnimations
//
//  Created by amos.gyamfi@getstream.io on 28.2.2022.
//

import SwiftUI

struct SilentModeOnOff: View {
    
    @State private var silentModeOn = true
    
    var body: some View {
        HStack {
            Image(systemName: "bell.fill")
                .font(.largeTitle)
            
            VStack {
                Text("Silent mode")
                Text("On")
            }
        }
        .padding(EdgeInsets(top: 4, leading: 16, bottom: 4, trailing: 16))
        .background(Color(.systemGray4))
        .cornerRadius(32)
    }
}

struct SilentModeOnOff_Previews: PreviewProvider {
    static var previews: some View {
        SilentModeOnOff()
            .preferredColorScheme(.dark)
    }
}
