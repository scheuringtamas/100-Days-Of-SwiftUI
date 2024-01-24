import SwiftUI

struct HabitsView: View {
    @State private var activities = Activities()
    @State private var showingAddView = false
    @State private var amount: Int = 0
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(Array(activities.habits.enumerated()), id: \.element.id) { (index, item) in
                    NavigationLink(destination: DetailView(amount: $amount)) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.title)
                                    .font(.headline)
                                Text(item.description)
                                Text("Completed \(amount) times")
                            }
                        }
                    }
                }
                .onDelete(perform: { indices in
                    activities.habits.remove(atOffsets: indices)
                })
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Habits")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add new habit", systemImage: "plus") {
                        showingAddView = true
                    }
                }
            }
            .sheet(isPresented: $showingAddView) {
                AddView(activities: activities)
            }
        }
    }
}

