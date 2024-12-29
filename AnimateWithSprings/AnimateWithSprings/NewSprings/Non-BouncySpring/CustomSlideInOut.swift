import SwiftUI

// MARK: Use springs to build custom slide-in-slide-out effect

struct PlaceholderContent: Identifiable {
    let id = UUID()
}

struct CustomSlideInOut: View {
    @State private var offset: CGFloat = -260
    private let items = Array(repeating: PlaceholderContent(), count: 10)
    private let menuWidth: CGFloat = 280
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                // Background overlay
                if offset > -menuWidth {
                    Color.black
                        .opacity(0.3 * Double((offset + menuWidth) / menuWidth))
                        .ignoresSafeArea()
                        .onTapGesture {
                            withAnimation(.spring(duration: 0.5)) {
                                offset = -menuWidth
                            }
                        }
                }
                
                // Slide-in menu with grabber
                HStack(spacing: 0) {
                    VStack {
                        // Header
                        HStack {
                            Text("Slide-in Content")
                                .font(.headline)
                            Spacer()
                            Button("Done") {
                                withAnimation(.spring(duration: 0.5)) {
                                    offset = -menuWidth
                                }
                            }
                        }
                        .padding()
                        
                        // List content
                        ScrollView {
                            VStack(spacing: 16) {
                                ForEach(items) { _ in
                                    HStack(spacing: 12) {
                                        Circle()
                                            .fill(Color.gray.opacity(0.3))
                                            .frame(width: 40, height: 40)
                                        
                                        VStack(alignment: .leading, spacing: 4) {
                                            Rectangle()
                                                .fill(Color.gray.opacity(0.3))
                                                .frame(width: 120, height: 12)
                                            
                                            Rectangle()
                                                .fill(Color.gray.opacity(0.3))
                                                .frame(width: 200, height: 8)
                                        }
                                        Spacer()
                                    }
                                    .padding(.horizontal)
                                }
                            }
                        }
                    }
                    .frame(width: menuWidth)
                    .background(Color(uiColor: .systemBackground))
                    
                    // Grabber handle
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 40, height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        )
                        .padding()
                        .overlay(
                            VStack(spacing: 8) {
                                ForEach(0..<3) { _ in
                                    Circle()
                                        .fill(Color.gray)
                                        .frame(width: 4, height: 4)
                                }
                            }
                        )
                    
                        // Updated padding for the grabber
                        .padding(.leading, -20)
                        .padding(.trailing, 16) // Add padding to prevent touching the screen edge
                }
                .offset(x: offset)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            let newOffset = max(min(value.translation.width + offset, 0), -menuWidth)
                            offset = newOffset
                        }
                        .onEnded { value in
                            withAnimation(.spring(duration: 0.5)) {
                                if value.predictedEndTranslation.width > menuWidth/2 {
                                    offset = 0
                                } else {
                                    offset = -menuWidth
                                }
                            }
                        }
                )
            }
        }
    }
}

#Preview {
    CustomSlideInOut()
}
