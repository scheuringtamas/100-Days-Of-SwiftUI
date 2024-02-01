import SwiftUI
import SwiftData

struct ContentView: View {
    @Query var users: [User]
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(users) { user in
                    NavigationLink(value: user) {
                        VStack(alignment: .leading){
                            Text(user.name)
                                .font(.headline)
                            Text(user.isActive ? "Active" : "Not Active")
                                .font(.subheadline)
                                .foregroundStyle(user.isActive ? .green : .red)
                        }
                    }
                }
            }
            .navigationTitle("Users")
            .navigationDestination(for: User.self) { user in
                DetailView(user: user)
            }
            .task {
                if users.isEmpty {
                    await fetchData()
                }
            }
        }
    }
    
    func fetchData() async {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
           
            if let decodedUsers = try decoder.decode([User]?.self, from: data) {
              for user in decodedUsers {
                  modelContext.insert(user)
              }
            }
            else {
                print("Decoding failed!")
            }
        } catch {
            print("Error fetching data")
        }
    }
}

#Preview {
    ContentView()
}
