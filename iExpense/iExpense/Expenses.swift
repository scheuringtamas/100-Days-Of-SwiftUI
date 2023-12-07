import Foundation

@Observable
class Expenses {
    var itemsPersonal = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(itemsPersonal) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    var itemsBusiness = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(itemsBusiness) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                itemsPersonal = decodedItems
                itemsBusiness = decodedItems
                return
            }
        }

        itemsPersonal = []
        itemsBusiness = []
    }
}
