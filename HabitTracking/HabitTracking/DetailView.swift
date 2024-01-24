import SwiftUI

struct DetailView: View {
    @State private var activities = Activities()
    @Binding var amount: Int
    
    
    var body: some View {
        List {
            ForEach(activities.habits) { item in
                Text(item.title)
                Text(item.description)
                Stepper("Completed \(amount) times", value: $amount, in: 0...100)
            }
        }
    }
}
