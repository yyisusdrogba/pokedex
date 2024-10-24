//
//  PokemonRangeUseCaseProtocol.swift
//  PokeAPI
//
//  Created by Jesus Gonzalez on 23/10/24.
//

import Foundation

protocol PokemonRangeUseCaseProtocol {
    var pokemonRepository: PokemonRepository { get }
    func execute() -> [PokemonRange]
}
