import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    @State private var sortSelection: SortSelection = .defaultSort
    @State private var showingSortOptions = false
    @StateObject var favorites = Favorites()
    
    enum SortSelection {
        case defaultSort
        case name
        case country
    }
    
    var filteredResorts: [Resort] {
        if searchText.isEmpty {
            return resorts
        } else {
            return resorts.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var sortedResorts: [Resort] {
        switch sortSelection {
        case .defaultSort:
            return filteredResorts
        case .name:
            return filteredResorts.sorted { $0.name < $1.name }
        case .country:
            return filteredResorts.sorted { $0.country < $1.country }
        }
    }
    
    
    let allNames = ["Subh", "Vina", "Melvin", "Stefanie"]
    let resorts: [Resort] = Bundle.main.decode("resorts.json")

    var body: some View {
        NavigationView {
            List(sortedResorts) { resort in
                NavigationLink {
                    ResortView(resort: resort)
                } label: {
                    HStack {
                        Image(resort.country)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 25)
                            .clipShape(
                                RoundedRectangle(cornerRadius: 5)
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.black, lineWidth: 1)
                            )
                        
                        VStack(alignment: .leading) {
                            Text(resort.name)
                                .font(.headline)
                            Text("\(resort.runs) runs")
                                .foregroundColor(.secondary)
                        }
                        
                        if favorites.contains(resort) {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibilityLabel("This is a favorite resort")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .navigationTitle("Resorts")
            .searchable(text: $searchText, prompt: "Search for a resort")
            .toolbar {
                ToolbarItem {
                    Button {
                        showingSortOptions = true
                    } label: {
                        Label("Sort Options", systemImage: "line.3.horizontal.decrease.circle")
                    }
                }
            }
            .confirmationDialog("Sort order", isPresented: $showingSortOptions) {
                Button("Default") { sortSelection = .defaultSort }
                Button("Alphabetical") { sortSelection = .name }
                Button("By Country") { sortSelection = .country }
            }
            
            WelcomeView()
        }
        .environmentObject(favorites)
    }

    var filteredNames: [String] {
        if searchText.isEmpty {
            return allNames
        } else {
            return allNames.filter { $0.contains(searchText) }
        }
    }
}

#Preview {
    ContentView()
}
