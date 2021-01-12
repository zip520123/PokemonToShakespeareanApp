//
//  PokeApiTest.swift
//  PokemonToShakespeareanKitTests
//
//  Created by zip520123 on 11/01/2021.
//  Copyright © 2021 zip520123. All rights reserved.
//

import XCTest
@testable import PokemonToShakespeareanKit

class PokeApiTest: XCTestCase {
    func test_PokemonSpeciesModelDecode() throws {
        let data = try readString(from: "getPokeApiSpecies.json").data(using: .utf8)!
        _ = try JSONDecoder().decode(PokemonSpecies.self, from: data)
        
    }
    
    func test_pokeApiSpeciesInterface_withNameWormadam() {
        let sut = PokeApi()
        let expect = expectation(description: "get Poke Api Species")
        sut.getPokeApiSpecies(with: "wormadam") { (result) in
            XCTAssertNotNil(result)
            expect.fulfill()
        }
        wait(for: [expect], timeout: 2)
    }
    
    func test_DecodePokemonResource() throws {
        let data = try readString(from: "getPokemonResource.json").data(using: .utf8)!
        _ = try JSONDecoder().decode(PokemonResource.self, from: data)
    }
    
    func test_pokeApiResourceInterface_withNameButterfree() {
        let sut = PokeApi()
        let expect = expectation(description: "get Poke Api Species")
        sut.getPokeApiPokemonResource(with: "butterfree") { (result) in
            XCTAssertNotNil(result)
            expect.fulfill()
        }
        wait(for: [expect], timeout: 2)
    }

}
extension XCTestCase {
    
    func readString(from file: String) throws -> String {
        let bundle = Bundle(for: type(of: self))
        let path = bundle.url(forResource: file, withExtension: nil)!
        let data = try Data(contentsOf: path)
        return String(data: data, encoding: .utf8)!
    }
    
}
