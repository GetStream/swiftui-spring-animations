import SwiftUI

struct PlaceholderItem: Identifiable {
    let id = UUID()
}

struct SheetPresentationDismissal: View {
    @State private var isSheetPresented = false
    private let items = Array(repeating: PlaceholderItem(), count: 10)
    
    var body: some View {
        Button("Present Sheet") {
            isSheetPresented = true
        }
        .sheet(isPresented: $isSheetPresented) {
            NavigationStack {
                List(items) { _ in
                    HStack(spacing: 12) {
                        // Circle avatar
                        Circle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: 40, height: 40)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            // Name placeholder
                            Rectangle()
                                .fill(Color.gray.opacity(0.3))
                                .frame(width: 120, height: 12)
                            
                            // Summary text placeholder
                            Rectangle()
                                .fill(Color.gray.opacity(0.3))
                                .frame(width: 200, height: 8)
                        }
                    }
                    .padding(.vertical, 8)
                }
                .navigationTitle("Sheet Content")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Done") {
                            isSheetPresented = false
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    SheetPresentationDismissal()
}
