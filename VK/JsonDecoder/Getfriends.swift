

import Foundation


struct GetFriendsResponse: Decodable {
    let response: Response
}

struct Response: Decodable {
    let count: Int
    let items: [Getfriends]
}

struct Getfriends: Codable {
    var id: Int?
    var nickname: String?
    var lists: [Int]?
    var trackCode: String?
    var firstName: String?
    var lastName: String?
    var canAccessClosed: Bool?
    var isClosed: Bool?
}

enum CodingKeys: String, CodingKey {
    case id
    case nickname
    case lists
    case trackCode = "track_code"
    case firstName = "first_name"
    case lastName = "last_name"
    case canAccessClosed = "can_access_closed"
    case isClosed = "is_closed"

}
