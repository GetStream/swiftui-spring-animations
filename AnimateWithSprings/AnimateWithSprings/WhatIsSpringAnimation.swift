import SwiftUI

struct WhatIsSpringAnimation: View {
    @State private var phase: CGFloat = 0
    
    var body: some View {
        GeometryReader { geometry in
            PhaseAnimator([false , true]) { animate in
                HStack(spacing: -70){
                    SpringShape(amplitude: 20, frequency: 10)
                        .trim(from: 0, to: animate ? 0 : 1)
                        .stroke(.blue.gradient, lineWidth: 2)
                        .frame(width: animate ? 0.0 : geometry.size.width/1.5, height: geometry.size.height, alignment: .leading)
                        .scaleEffect(y: animate ? 1 : 0.6)
                    Circle()
                        .fill(.blue.gradient)
                        .frame(width: 80, height: 80)
                        .shadow(radius: 12, x: 0, y: 10)
                        .overlay(
                            Circle()
                                .stroke(.white, style: StrokeStyle(lineWidth: 2))
                        )
                }
            } animation: { _ in
                    .snappy(duration: 5, extraBounce: 0.8)
            }
            
        }
    }
}

struct SpringShape: Shape {
    var amplitude: CGFloat
    var frequency: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.width
        let height = rect.height
        let midHeight = height / 2
        let wavelength = width / frequency
        
        path.move(to: CGPoint(x: 0, y: midHeight))
        
        for x in stride(from: 0, through: width, by: 1) {
            let relativeX = x / wavelength
            let sine = sin(relativeX * .pi * 2)
            let y = midHeight + sine * amplitude
            path.addLine(to: CGPoint(x: x, y: y))
        }
        
        return path
    }
}

#Preview {
    WhatIsSpringAnimation()
        .frame(height: 200)
        .preferredColorScheme(.dark)
}

