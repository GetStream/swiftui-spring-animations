//
//  SpringModelAnimation.swift
//  AnimateWithSprings
//
import SwiftUI

enum SpringModelPhases {
    case start, middle, end
}

struct SpringModelAnimation: View {
    
    var body: some View {
        // Spring Model
        let springModel = Spring(duration: 1.0, bounce: 0.4)
        let (mass, stiffness, damping) = (springModel.mass, springModel.stiffness, springModel.damping)
        
        Rectangle()
            .fill(.blue.gradient)
            .frame(width: 200, height: 200)
            .phaseAnimator([SpringModelPhases.start, .middle, .end], content: { view, morthRotate in
                view
                    .cornerRadius(morthRotate == .start ? 0 :
                                    morthRotate == .middle ? 32 : 100)
                    .rotationEffect(.degrees(morthRotate == .middle ? 180 : 0))
            }, animation: { morthRotate in
                switch morthRotate {
                case .start: return
                        .interpolatingSpring(
                            mass: mass,
                            stiffness: stiffness,
                            damping: damping)
                case .middle: return
                        .interpolatingSpring(
                            mass: mass,
                            stiffness: stiffness,
                            damping: damping)
                case .end: return
                        .interpolatingSpring(
                            mass: mass,
                            stiffness: stiffness,
                            damping: damping)
                }
            })
    }
}


#Preview {
    SpringModelAnimation()
        .preferredColorScheme(.dark)
}
