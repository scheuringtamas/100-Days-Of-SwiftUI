import SwiftUI

struct ContentView: View {
    @State private var showingGrid = true
    
    var body: some View {
        NavigationStack {
            Group {
                if showingGrid {
                   GridLayout()
                } else {
                    ListLayout()
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                Button("Switch layout") {
                    showingGrid.toggle()
                }
            }
        }
    }
}


#Preview {
    ContentView()
}
