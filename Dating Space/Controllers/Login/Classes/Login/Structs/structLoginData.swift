// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let currentUser = try? newJSONDecoder().decode(CurrentUser.self, from: jsonData)

import Foundation

// MARK: - CurrentUser
struct currentUser: Codable {
    let uuid: String
    let userData: UserData
    let dateCreated: Double
    let displayName: String
    let friendCount: Int
    let userSettings: UserSettings
    let admin: Bool
    let friends: [Friend]

    enum CodingKeys: String, CodingKey {
        case uuid
        case userData = "user_data"
        case dateCreated = "date_created"
        case displayName = "display_name"
        case friendCount = "friend_count"
        case userSettings = "user_settings"
        case admin, friends
    }
}

// MARK: - Friend
struct Friend: Codable {
    let firstName, middleName, id, name: String
    let lastName: String

    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case middleName = "middle_name"
        case id, name
        case lastName = "last_name"
    }
}

// MARK: - UserData
struct UserData: Codable {
    let name, id, gender, firstName: String
    let middleName, birthday: String
    let picture: Picture
    let lastName: String

    enum CodingKeys: String, CodingKey {
        case name, id, gender
        case firstName = "first_name"
        case middleName = "middle_name"
        case birthday, picture
        case lastName = "last_name"
    }
}

// MARK: - Picture
struct Picture: Codable {
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let width, height: Int
    let url: String
    let isSilhouette: Bool

    enum CodingKeys: String, CodingKey {
        case width, height, url
        case isSilhouette = "is_silhouette"
    }
}

// MARK: - UserSettings
struct UserSettings: Codable {
    let location: Location
    let lookingFor: String
    let banned: Bool

    enum CodingKeys: String, CodingKey {
        case location
        case lookingFor = "looking_for"
        case banned
    }
}

// MARK: - Location
struct Location: Codable {
    let lat, lng: Double
}
