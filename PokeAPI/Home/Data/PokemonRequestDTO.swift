//
//  PokemonRequestDTO.swift
//  PokeAPI
//
//  Created by Jesus Gonzalez on 26/09/24.
//

import Foundation

struct PokemonRequestDTO: Decodable {
    let results: [PokemonResponse]?
}

struct PokemonResponse: Decodable {
    let name: String?
    let url: String?
}
