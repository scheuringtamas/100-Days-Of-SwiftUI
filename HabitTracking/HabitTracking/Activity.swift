import Foundation

struct Activity: Codable, Identifiable, Equatable {
    let id = UUID()
    let title: String
    let description: String
}
