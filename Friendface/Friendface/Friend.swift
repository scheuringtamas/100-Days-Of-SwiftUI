import Foundation

struct Friend: Codable, Identifiable, Hashable {
    let id: UUID
    let name: String
}
