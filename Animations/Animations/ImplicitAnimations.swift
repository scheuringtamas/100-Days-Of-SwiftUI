import SwiftUI

struct ImplicitAnimations: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        Button("Tap Me") {
            animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .scaleEffect(animationAmount)
        .animation(.default, value: animationAmount)
        .blur(radius: (animationAmount - 1) * 3)
    }
}

#Preview {
    ImplicitAnimations()
}
