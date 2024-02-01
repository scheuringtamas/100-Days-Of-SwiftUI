import SwiftUI

struct DetailView: View {
    let user: User
    
    var body: some View {
        Form {
            Section("Details") {
                Text("Name: \(user.name)")
                Text("Email: \(user.email)")
                Text("Age: \(user.age)")
                Text("Company: \(user.company)")
                Text("Address: \(user.address)")
                Text("About: \(user.about)")
                Text("Registered: \(formattedDate(user.registered))")
    
            }
            
            Section("Friends") {
                List(user.friends, id: \.id) { friend in
                    Text(friend.name)
                }
            }
        }
    }
    
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}

