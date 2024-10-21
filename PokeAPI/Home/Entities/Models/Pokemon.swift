//
//  Pokemon.swift
//  PokeAPI
//
//  Created by Jesus Gonzalez on 21/10/24.
//

import Foundation

struct Pokemon {
    let name: String
    let id: Int
    let types: String
    var imageURL: String {
        "https://raw.githubusercontent.com/PokeAPI/sprites/refs/heads/master/sprites/pokemon/\(String(id)).png"
    }
}
