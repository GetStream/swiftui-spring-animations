//
//  MassStiffnessDamping.swift
//  AnimateWithSprings
//  Hamburger to Back

//  MARK: Transition from one state to another. This example also demonstrates spring modeling

import SwiftUI

// Your imports remain the same

struct MassStiffnessDamping: View {
    
    @State private var isChanging = false
    private var animation: Animation {
        let massStiffnessDampingSpring = Spring(mass: 1, stiffness: 200, damping: 20)
        return Animation.spring(massStiffnessDampingSpring)
    }
    
    var body: some View {
        Button {
            withAnimation(animation) {
                isChanging.toggle()
            }
        } label: {
            VStack(spacing: isChanging ? -12 : 14){
                
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: isChanging ? 48 : 64, height: 10)
                    .rotationEffect(.degrees(isChanging ? -30 : 0), anchor: .leading)
                    .offset(x: isChanging ? -16 : 0)
                
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: 64, height: 10)
                    .scaleEffect(x: isChanging ? 1.2 : 1, anchor: .leading)
                
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: isChanging ? 48 : 64, height: 10)
                    .rotationEffect(.degrees(isChanging ? 30 : 0), anchor: .leading)
                    .offset(x: isChanging ? -16 : 0)
                
            }
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    MassStiffnessDamping()
        .preferredColorScheme(.dark)
}
