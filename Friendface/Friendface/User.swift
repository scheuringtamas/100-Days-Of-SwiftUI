import Foundation

struct User: Codable, Identifiable, Hashable {
    let id: UUID
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: Date
    
    var tags: [String]
    var friends: [Friend]
    
}
