//
//  ShakespeareTranslatorAPI.swift
//  PokemonToShakespeareanKit
//
//  Created by zip520123 on 11/01/2021.
//  Copyright © 2021 zip520123. All rights reserved.
//

import Foundation
struct ShakespeareTranslatorAPI {
    //https://api.funtranslations.com/translate/shakespeare.json
    let scheme = "https"
    let host = "api.funtranslations.com"
    let session = URLSession.shared
    
    private func defualtURLComponets() -> URLComponents {
        var urlc = URLComponents()
        urlc.host = host
        urlc.scheme = scheme
        urlc.queryItems = []
        return urlc
    }
    
    func getShakespeare(with string: String, callback: @escaping ((Shakespeare?)->())) {
        var urlc = defualtURLComponets()
        urlc.path = "/translate/shakespeare.json"
        urlc.queryItems?.append(URLQueryItem(name: "text", value: string))
        
        let url = urlc.url!
        
        let request = URLRequest(url: url)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if let data = data, let result = try? JSONDecoder().decode(Shakespeare.self, from: data) {
                callback(result)
            } else {
                callback(nil)
            }
        }
        
        task.resume()
    }
}
