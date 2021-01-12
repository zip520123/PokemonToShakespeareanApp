//
//  ShakespeareResult.swift
//  PokemonToShakespeareanKit
//
//  Created by zip520123 on 11/01/2021.
//  Copyright © 2021 zip520123. All rights reserved.
//

import Foundation
// MARK: - Shakespeare
struct Shakespeare: Codable {
    let success: Success
    let contents: Contents
}

// MARK: - Contents
struct Contents: Codable {
    let translated, text, translation: String
}

// MARK: - Success
struct Success: Codable {
    let total: Int
}

