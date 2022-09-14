// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - WelcomeElement
struct NetworkDataModel: Codable {
    var name: String
    var price: Int
    let image, imageS, imageM, imageL: String
    var size, sugar, additions: Int
    var isAddedToCart: Bool
    var boughtItemsCount, id: Int
}

typealias Welcome = [NetworkDataModel]
