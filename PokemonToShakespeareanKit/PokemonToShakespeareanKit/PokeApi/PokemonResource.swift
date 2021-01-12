//
//  PokemonResource.swift
//  PokemonToShakespeareanKit
//
//  Created by zip520123 on 11/01/2021.
//  Copyright © 2021 zip520123. All rights reserved.
//

import Foundation
public struct PokemonResource: Codable {
    public let id: Int
    public let name: String
    public let sprites: Sprites
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case sprites
    }
}

public struct Sprites: Codable {
    public let backDefault, backFemale, backShiny, backShinyFemale: String
    public let frontDefault, frontFemale, frontShiny, frontShinyFemale: String
    
    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backFemale = "back_female"
        case backShiny = "back_shiny"
        case backShinyFemale = "back_shiny_female"
        case frontDefault = "front_default"
        case frontFemale = "front_female"
        case frontShiny = "front_shiny"
        case frontShinyFemale = "front_shiny_female"
    }
}


