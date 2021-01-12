//
//  ShakespeareTranslatorAPITest.swift
//  PokemonToShakespeareanKitTests
//
//  Created by zip520123 on 11/01/2021.
//  Copyright © 2021 zip520123. All rights reserved.
//

import XCTest
@testable import PokemonToShakespeareanKit

class ShakespeareTranslatorAPITest: XCTestCase {
    func test_decodeShakespeareTranslatorAPIModel() throws {
        let data = try readString(from: "shakespeareResult.json").data(using: .utf8)!
        _ = try JSONDecoder().decode(Shakespeare.self, from: data)
        
    }
    func test_realShakespeareTranslatorAPI() throws {
        let sut = ShakespeareTranslatorAPI()
        let expect = expectation(description: "get Shakespeare callback")
        let string = "Hello World"
        sut.getShakespeare(with: string) { (result) in
            XCTAssertNotNil(result)
            XCTAssertNotEqual(string, result?.contents.translated)
            expect.fulfill()
        }
        wait(for: [expect], timeout: 1)
    }
}
