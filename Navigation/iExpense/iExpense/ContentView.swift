import SwiftUI
import Observation

struct ContentView: View {
    @State private var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
                List {
                    Section("Personal expenses") {
                        ForEach(expenses.itemsPersonal) { item in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.type)
                                }

                                Spacer()
                                Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                    .modifier(Custom(amount: Int(item.amount)))
                            }
                        }
                        .onDelete(perform: removePersonalItems)
                    }
                    
                    Section("Business expenses"){
                        ForEach(expenses.itemsBusiness) { item in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.type)
                                }
                                
                                Spacer()
                                Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                    .modifier(Custom(amount: Int(item.amount)))
                            }
                        }
                        .onDelete(perform: removeBusinessItems)
                    }
                }
                .navigationTitle("iExpense")
                .toolbar {
                    NavigationLink(destination: AddView(expenses: expenses), isActive: $showingAddExpense){}
                    Button("Add Expense", systemImage: "plus") {
                        showingAddExpense = true
                    }
                }
        }
    }
    
    func removePersonalItems(at offsets: IndexSet) {
        expenses.itemsPersonal.remove(atOffsets: offsets)
    }
    
    func removeBusinessItems(at offsets: IndexSet) {
        expenses.itemsBusiness.remove(atOffsets: offsets)
    }
}

struct Custom: ViewModifier {
    let amount: Int
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(getColor())
    }
    
    func getColor() -> Color {
        if(amount < 10) {
            return Color.blue
        } else if(amount < 100) {
            return Color.red
        } else {
            return Color.green
        }
    }
}



#Preview {
    ContentView()
}
