// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let topCities = try? JSONDecoder().decode(TopCities.self, from: jsonData)

import Foundation

// MARK: - TopCity
struct TopCity: Codable {

    let localizedName: String

    enum CodingKeys: String, CodingKey {
        case localizedName = "LocalizedName"
    }
}

typealias TopCities = [TopCity]
