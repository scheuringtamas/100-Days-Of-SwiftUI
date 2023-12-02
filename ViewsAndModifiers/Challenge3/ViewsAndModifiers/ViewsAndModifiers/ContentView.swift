import SwiftUI

struct Custom: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.blue)
    }
}

extension View {
    func style() -> some View {
        self.modifier(Custom())
    }
}

struct ContentView: View {
    var body: some View {
     Text("ViewModifier")
            .style()
            
    }
}

#Preview {
    ContentView()
}
