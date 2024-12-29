//
//  ProceedWithTouchID.swift
//  AnimateWithSprings
//
//  Created by Amos Gyamfi on 24.12.2024.
//

import SwiftUI

struct ProceedWithTouchID: View {
    @State private var isTouched = false
    @State private var isDrawingCircle = false
    @State private var isScalingUp = false
    @State private var isDrawingCheckmark = false
    
    var body: some View {
        ZStack() {
            Button {
                // Add button action
                withAnimation(.easeInOut(duration: 1.0)) {
                    isDrawingCircle = true
                }
                
                // Add button action
                withAnimation(.easeInOut(duration: 1.0).delay(0.25)) {
                    isTouched = true
                }
                
                // Scale up animation with delay
                withAnimation(.bouncy(duration: 0.8, extraBounce: 0.12).delay(1.25)) {
                    isScalingUp = true
                }
                
                // Draw checkmark with delay
                withAnimation(.easeInOut(duration: 0.8).delay(1.5)) {
                    isDrawingCheckmark = true
                }
            } label: {
                ZStack {
                    Circle() // inactive circle remains the same
                        .stroke(style: StrokeStyle(lineWidth: 6))
                        .frame(width: 120, height: 120)
                        .foregroundStyle(.secondary)
                    
                    Circle() // tealStrokedCircle
                        .trim(from: 0.0, to: isDrawingCircle ? 1.0 : 0.0)
                        .stroke(style: StrokeStyle(lineWidth: 6))
                        .frame(width: 120, height: 120)
                        .foregroundStyle(.teal.gradient)
                        .rotationEffect(.degrees(-90))
                    
                    ZStack {
                        Image(systemName: "touchid") // inactiveTouchIDSymbol remains the same
                            .font(.system(size: 90))
                            .foregroundStyle(.secondary)
                        
                        Image(systemName: "touchid") // activeTouchIDSymbol
                            .font(.system(size: 90))
                            .foregroundStyle(.pink)
                            .clipShape(
                                Rectangle()
                                    .offset(x: 0.0, y: isTouched ? 0.0 : 120.0)
                            )
                    }
                    
                    Circle() // tealFilledCircle
                        .frame(width: 120, height: 120)
                        .foregroundStyle(.teal.gradient)
                        .scaleEffect(isScalingUp ? 1.0 : 0.0)
                    
                    Checkmark() // checkmark
                        .trim(from: isDrawingCheckmark ? 0.0 : 1.0, to: 1.0)
                        .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round))
                        .frame(width: 60, height: 60)
                }
            }
            .buttonStyle(.plain)
        }
    }
}

struct Checkmark: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.35911*width, y: 0.99201*height))
        path.addCurve(to: CGPoint(x: 0.40705*width, y: 0.96582*height), control1: CGPoint(x: 0.37997*width, y: 0.99201*height), control2: CGPoint(x: 0.39551*width, y: 0.98269*height))
        path.addLine(to: CGPoint(x: 0.95659*width, y: 0.10423*height))
        path.addCurve(to: CGPoint(x: 0.96902*width, y: 0.06916*height), control1: CGPoint(x: 0.96546*width, y: 0.09047*height), control2: CGPoint(x: 0.96902*width, y: 0.07981*height))
        path.addCurve(to: CGPoint(x: 0.92418*width, y: 0.02433*height), control1: CGPoint(x: 0.96902*width, y: 0.04208*height), control2: CGPoint(x: 0.95126*width, y: 0.02433*height))
        path.addCurve(to: CGPoint(x: 0.88335*width, y: 0.04918*height), control1: CGPoint(x: 0.90554*width, y: 0.02433*height), control2: CGPoint(x: 0.89444*width, y: 0.03098*height))
        path.addLine(to: CGPoint(x: 0.35689*width, y: 0.88104*height))
        path.addLine(to: CGPoint(x: 0.08789*width, y: 0.53924*height))
        path.addCurve(to: CGPoint(x: 0.04616*width, y: 0.51571*height), control1: CGPoint(x: 0.07591*width, y: 0.52281*height), control2: CGPoint(x: 0.06436*width, y: 0.51571*height))
        path.addCurve(to: CGPoint(x: 0, y: 0.56099*height), control1: CGPoint(x: 0.01909*width, y: 0.51571*height), control2: CGPoint(x: 0, y: 0.53435*height))
        path.addCurve(to: CGPoint(x: 0.0142*width, y: 0.5965*height), control1: CGPoint(x: 0, y: 0.57253*height), control2: CGPoint(x: 0.00444*width, y: 0.58451*height))
        path.addLine(to: CGPoint(x: 0.30939*width, y: 0.96493*height))
        path.addCurve(to: CGPoint(x: 0.35911*width, y: 0.99201*height), control1: CGPoint(x: 0.32404*width, y: 0.98357*height), control2: CGPoint(x: 0.33869*width, y: 0.99201*height))
        path.closeSubpath()
        return path
    }
}

#Preview {
    ProceedWithTouchID()
        .preferredColorScheme(.dark)
}
