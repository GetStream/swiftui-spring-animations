
import SwiftUI

struct SilentModeOn: View {
    
    @State private var showing = true
    @State private var rotating = false
    
    var body: some View {
        HStack {
            Image(systemName: "bell.fill")
                .font(.largeTitle)
                .rotationEffect(.degrees(rotating ? 0 : -45), anchor: .top)
                .animation(.spring(response: 0.2, dampingFraction: 0.825/4, blendDuration: 0).repeatCount(1, autoreverses: true).delay(0.25), value: rotating)
            
            VStack {
                Text("Silent Mode")
                Text("On")
            }
        }
        .padding(EdgeInsets(top: 4, leading: 16, bottom: 4, trailing: 16))
        .background(Color(.systemGray4))
        .cornerRadius(32)
        .offset(y: showing ? -UIScreen.main.bounds.height/1.5 : -UIScreen.main.bounds.height/2.5)
        .onAppear {
            
            rotating.toggle()
            
            withAnimation(.bouncy()) {
                showing.toggle()
            }
        }
    }
}

#Preview {
    SilentModeOn()
        .preferredColorScheme(.dark)
}
