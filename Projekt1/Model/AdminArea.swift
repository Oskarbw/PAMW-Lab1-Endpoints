// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let adminAreas = try? JSONDecoder().decode(AdminAreas.self, from: jsonData)

import Foundation

// MARK: - AdminArea
struct AdminArea: Codable {
    let id, localizedName, englishName: String
    let level: Int
    let localizedType, englishType: EnglishTypeEnum
    let countryID: CountryID

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case localizedName = "LocalizedName"
        case englishName = "EnglishName"
        case level = "Level"
        case localizedType = "LocalizedType"
        case englishType = "EnglishType"
        case countryID = "CountryID"
    }
}

enum CountryID: String, Codable {
    case pl = "PL"
}

enum EnglishTypeEnum: String, Codable {
    case voivodship = "Voivodship"
}

typealias AdminAreas = [AdminArea]
