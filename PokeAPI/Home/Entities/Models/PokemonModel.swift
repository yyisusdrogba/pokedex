//
//  PokemonModel.swift
//  PokeAPI
//
//  Created by Jesus Gonzalez on 26/09/24.
//

import Foundation

struct PokemonModel {
    let name: String
    let id: UUID = UUID()
    let url: String
    var imageURL: String {
        "https://raw.githubusercontent.com/PokeAPI/sprites/refs/heads/master/sprites/pokemon/\(url.split(separator: "/").last ?? "1").png"
    }
}


//var imageURL: String {
//    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(url.split(separator: "/").last ?? "1").png"
//}
