

import Foundation

struct GetPhotoResponse: Decodable {
    let response: Response1
}

struct Response1: Decodable {
    let count: Int
    let items: [GetPhoto]
}

struct GetPhoto: Decodable {
    var date: Int
    var id: Int
    var ownerId: Int?
    var postId: Int?
    var sizes: [PhotoSizes]
    var text: String
    var hasTags: String?
}

struct PhotoSizes: Decodable {
    var height: Int
    var url: String
    var type: String
    var width: Int    
}

enum CodingKeysPhoto: String, CodingKey {
    case date
    case id
    case ownerId = "owner_id"
    case postId = "post_id"
    case sizes
    case text
    case hasTags = "has_tags"
}

