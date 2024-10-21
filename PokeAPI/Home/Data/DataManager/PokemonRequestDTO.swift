//
//  PokemonRequestDTO.swift
//  PokeAPI
//
//  Created by Jesus Gonzalez on 17/10/24.
//

import Foundation

struct PokemonRequestDTO: Decodable {
    let results: [PokemonRequestResultsDTO]
}

struct PokemonRequestResultsDTO: Decodable {
    let name: String
    let url: String
}
