import SwiftUI

struct AddView: View {
    @State private var title = ""
    @State private var description = ""
    @State private var amount = 0.0
    var activities: Activities
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $title)
                TextField("Description", text: $description)
            }
            .navigationTitle("Add activity")
            .toolbar {
                Button("Save") {
                    let activity = Activity(title: title, description: description)
                    activities.habits.append(activity)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddView(activities: Activities())
}
