import SwiftUI
import SwiftData

@main
struct Friendface2App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
