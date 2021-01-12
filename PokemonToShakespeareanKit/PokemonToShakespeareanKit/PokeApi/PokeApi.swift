//
//  PokeApi.swift
//  PokemonToShakespeareanKit
//
//  Created by zip520123 on 11/01/2021.
//  Copyright © 2021 zip520123. All rights reserved.
//

import Foundation

struct PokeApi {
    
    let scheme = "https"
    let host = "pokeapi.co"
    let session = URLSession.shared
    
    private func defualtURLComponets() -> URLComponents {
        var urlc = URLComponents()
        urlc.host = host
        urlc.scheme = scheme
        urlc.queryItems = []
        return urlc
    }
    
    func getPokeApiSpecies(with name: String, callback: @escaping ((PokemonSpecies?)->())) {
        var urlc = defualtURLComponets()
        urlc.path = "/api/v2/pokemon-species/\(name)/"
        let url = urlc.url!
        
        let request = URLRequest(url: url)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if let data = data, let result = try? JSONDecoder().decode(PokemonSpecies.self, from: data) {
                callback(result)
            } else {
                callback(nil)
            }
        }
        
        task.resume()
    }
    
    func getPokeApiPokemonResource(with name: String, callback: @escaping ((PokemonResource?)->())) {
        var urlc = defualtURLComponets()
        urlc.path = "/api/v2/pokemon/\(name)/"
        let url = urlc.url!
        
        let request = URLRequest(url: url)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if let data = data, let result = try? JSONDecoder().decode(PokemonResource.self, from: data) {
                callback(result)
            } else {
                callback(nil)
            }
        }
        
        task.resume()
    }
}



