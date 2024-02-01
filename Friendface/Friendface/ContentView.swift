import SwiftUI

struct ContentView: View {
    @State private var users: [User] = []
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(users) { user in
                    NavigationLink(value: user) {
                        VStack(alignment: .leading){
                            Text(user.name)
                                .font(.headline)
                            Text(user.email)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .navigationTitle("Users")
            .navigationDestination(for: User.self) { user in
                DetailView(user: user)
            }
            .task {
                await fetchData()
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
           
            if let decodedUsers = try? decoder.decode([User].self, from: data) {
                users = decodedUsers
            }
            
        } catch {
            print("Error fetching data")
        }
    }
}

#Preview {
    ContentView()
}
