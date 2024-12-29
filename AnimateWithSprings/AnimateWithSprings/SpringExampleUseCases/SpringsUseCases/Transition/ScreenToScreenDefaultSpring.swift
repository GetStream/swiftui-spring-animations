import SwiftUI

struct ScreenToScreenDefaultSpring: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Private")) {
                    NavigationLink(destination: Text("Getting Started")) {
                        Label("Getting Started on Mobile", systemImage: "doc")
                    }
                    
                    NavigationLink(destination: Text("Habit Tracker")) {
                        Label("Habit Tracker", systemImage: "checkmark")
                    }
                    
                    NavigationLink(destination: Text("Weekly To-do")) {
                        Label("Weekly To-do List", systemImage: "list.bullet")
                    }
                    
                    NavigationLink(destination: Text("Personal Website")) {
                        Label("Personal Website", systemImage: "person.circle")
                    }
                }
                
                NavigationLink(destination: Text("Templates")) {
                    Label("Browse templates", systemImage: "doc.on.doc")
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Alex's Notion")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: "ellipsis")
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    HStack {
                        Image(systemName: "a.square.fill")
                            .foregroundStyle(.secondary)
                        VStack(alignment: .leading) {
                            Text("Notion")
                                .fontWeight(.semibold)
                            Text("alex@gmail.com")
                                .fontWeight(.light)
                        }
                    }
                }
            }
        }
        .overlay(TabBarView(), alignment: .bottom)
    }
}

#Preview {
    ScreenToScreenDefaultSpring()
}
