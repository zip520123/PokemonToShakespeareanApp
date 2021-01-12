//
//  Copyright © 2021 zip520123. All rights reserved.
//

import Foundation

public func getShakespeareanDescription(with name: String, callback:@escaping ((String)->())) {
    getPokemonEnglishDescription(with: name) { (englishDescritption) in
        let shackspeareApi = ShakespeareTranslatorAPI()
        shackspeareApi.getShakespeare(with: englishDescritption) { (result) in
            if let shackspeare = result {
                callback(shackspeare.contents.translated)
            } else {
                callback("")
            }
        }
    }
    
}
public func getPokemonEnglishDescription(with name: String, callback: @escaping ((String)->())) {
    let pokeApi = PokeApi()
    pokeApi.getPokeApiSpecies(with: name) { (pokemonSpecies) in
        if let result = pokemonSpecies {
            var flavorTextSet = Set<String>()
            for item in result.flavorTextEntries {
                if item.language.name == "en" {
                    flavorTextSet.insert(item.flavorText.replacingOccurrences(of: "\n", with: " "))
                }
            }
            callback(flavorTextSet.joined(separator: " "))
        } else {
            callback("can't find any description with \(name)")
        }
    }
}

public func getPokemonSprites(with name: String, callback: @escaping ((PokemonResource?)->())) {
    let pokeApi = PokeApi()
    pokeApi.getPokeApiPokemonResource(with: name) { (pokeresource) in
        callback(pokeresource)
    }

}
