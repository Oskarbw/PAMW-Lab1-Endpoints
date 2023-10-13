// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let continents = try? JSONDecoder().decode(Continents.self, from: jsonData)

import Foundation

// MARK: - Continent
struct Continent: Codable {
    let id, localizedName, englishName: String

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case localizedName = "LocalizedName"
        case englishName = "EnglishName"
    }
}

typealias Continents = [Continent]
