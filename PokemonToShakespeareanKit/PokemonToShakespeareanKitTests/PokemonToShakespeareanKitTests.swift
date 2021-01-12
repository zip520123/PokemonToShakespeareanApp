//
//  PokemonToShakespeareanKitTests.swift
//  PokemonToShakespeareanKitTests
//
//  Created by zip520123 on 11/01/2021.
//  Copyright © 2021 zip520123. All rights reserved.
//

import XCTest
import PokemonToShakespeareanKit

class PokemonToShakespeareanKitTests: XCTestCase {
    
    func test_giveApokemonName_returnItsEnglishDescription() {
        let name = "wormadam"
        let expect = expectation(description: "get pokemon english description callback")
        getPokemonEnglishDescription(with: name) { (description) in
            XCTAssertNotEqual(description,"")
            expect.fulfill()
        }
        wait(for: [expect], timeout: 2)
    }
    
    func test_giveApokemonName_returnItsShakespeareanDescription() {
        let name = "wormadam"
        let expect = expectation(description: "get Shakespearean Description callback")
        getShakespeareanDescription(with: name) { (description) in
            XCTAssertNotEqual(description,"")
            expect.fulfill()
        }
        wait(for: [expect], timeout: 2)
    }
    
    func test_pokemonToShakespearenKit_getPokemonSpritesWithName() {
        let expect = expectation(description: "get pokemon Sprites callback")
        getPokemonSprites(with: "pikachu") { (result) in
            XCTAssertNotNil(result)
            expect.fulfill()
        }
        
        wait(for: [expect], timeout: 2)
    }
}
