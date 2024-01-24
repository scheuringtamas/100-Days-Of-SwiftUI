import Foundation

@Observable
class Activities: Observable {
    
    var habits = [Activity]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(habits) {
                UserDefaults.standard.set(encoded, forKey: "Habits")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Habits") {
            if let decodedItems = try? JSONDecoder().decode([Activity].self, from: savedItems) {
                habits = decodedItems
                return
            }
        }
        habits = []
    }
}
