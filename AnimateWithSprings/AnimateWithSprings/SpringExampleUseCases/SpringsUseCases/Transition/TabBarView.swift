import SwiftUI

struct TabBarView: View {
    var body: some View {
        HStack(spacing: 0) {
            TabBarButton(icon: "house")
            TabBarButton(icon: "magnifyingglass")
            TabBarButton(icon: "tray")
            TabBarButton(icon: "square.and.pencil")
        }
        .frame(height: 50)
        .background(Color(UIColor.systemBackground))
        .overlay(Divider(), alignment: .top)
    }
}

struct TabBarButton: View {
    let icon: String
    
    var body: some View {
        Button(action: {}) {
            Image(systemName: icon)
                .font(.system(size: 20))
                .foregroundStyle(.primary)
                .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    TabBarView()
}
