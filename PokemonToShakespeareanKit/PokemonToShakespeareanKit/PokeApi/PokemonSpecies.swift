
import Foundation
struct PokemonSpecies: Codable {
    let id: Int
    let name: String
    let flavorTextEntries: [FlavorTextEntry]
    enum CodingKeys: String, CodingKey {
        case id, name
        case flavorTextEntries = "flavor_text_entries"
    }
}

// MARK: - Lang
struct Lang: Codable {
    let name: String
    let url: String
}

// MARK: - FlavorTextEntry
struct FlavorTextEntry: Codable {
    let flavorText: String
    let language: Lang
    let version: Version
    
    enum CodingKeys: String, CodingKey {
        case flavorText = "flavor_text"
        case language, version
    }
}

// MARK: - Version
struct Version: Codable {
    let name: String
    let url: String
}


