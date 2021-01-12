//
//  SearchPokemonViewController.swift
//  PokemonToShakespeareanApp
//
//  Created by zip520123 on 12/01/2021.
//  Copyright © 2021 zip520123. All rights reserved.
//

import UIKit
import PokemonToShakespeareanKit

class SearchPokemonViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var imageView4: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
        if let text = searchBar.text , text != "" {
            
            let name = text.lowercased()
            
            getShakespeareanDescription(with: name) {[weak self] (description) in
                guard let self = self else {return}
                DispatchQueue.main.async {
                    self.label.text = description
                }
            }
            getPokemonSprites(with: name) {[weak self] (result) in
                guard let self = self else {return}
                if let pokemon = result {
                    DispatchQueue.main.async {
                        
                        self.imageView1.downloaded(from: pokemon.sprites.frontDefault)
                        self.imageView2.downloaded(from: pokemon.sprites.backDefault)
                        self.imageView3.downloaded(from: pokemon.sprites.frontShiny)
                        self.imageView4.downloaded(from: pokemon.sprites.backShiny)
                    }
                }
            }
        }
    }

}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
