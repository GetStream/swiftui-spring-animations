// Import remains the same
import SwiftUI

struct SilentModeOnOff: View {
    @State private var isSilent = false
    
    var body: some View {
        VStack {
            Toggle(isSilent ? "Silent Mode On" : "Silent Mode Off", isOn: $isSilent)
                .padding()
            
            if isSilent {
                SilentModeOn()
            } else {
                SilentModeOff()
            }
        }
    }
}

// Preview remains the same
#Preview {
    SilentModeOnOff()
        .preferredColorScheme(.dark)
}

