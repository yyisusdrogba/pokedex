//
//  PokemonRangeUseCase.swift
//  PokeAPI
//
//  Created by Jesus Gonzalez on 22/10/24.
//

import Foundation

class PokemonRangeUseCase: PokemonRangeUseCaseProtocol{
    
    var pokemonRepository: PokemonRepository

    init(pokemonRepository: PokemonRepository) {
        self.pokemonRepository = pokemonRepository
    }
    
    func execute() -> [PokemonRange] {
        return pokemonRepository.pokemonRange()
    }
    
}
