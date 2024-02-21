import SwiftUI

struct ContentView: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]
    let fadeOutDistance: CGFloat = 200
    let minScale: CGFloat = 0.5

    var body: some View {
        GeometryReader { fullView in
            ScrollView(.vertical) {
                ForEach(0..<50) { index in
                    GeometryReader { proxy in
                        let offsetY = proxy.frame(in: .global).minY
                        let normalizedOffset = max(0, min(1, 1 - (offsetY - fadeOutDistance) / fullView.size.height))
                        let opacity = Double(normalizedOffset)
                        let scale = max(minScale, 1 - normalizedOffset * (1 - minScale))
                        
                        let hue = min(Double(normalizedOffset) * 0.6, 1.0)
                        let saturation: Double = 0.8
                        let brightness: Double = 0.8
                        let color = Color(hue: hue, saturation: saturation, brightness: brightness)
                        
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .background(color)
                            .rotation3DEffect(.degrees(proxy.frame(in: .global).minY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
                            .opacity(opacity)
                            .scaleEffect(scale)
                    }
                    .frame(height: 40)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
