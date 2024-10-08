//
//  PokemonRangeUseCase.swift
//  PokeAPI
//
//  Created by Jesus Gonzalez on 07/10/24.
//

import Foundation
import Combine

class PokemonRangeUseCase {
    
    let pokemonRepository: PokemonRepository
    
    init(pokemonRepository: PokemonRepository) {
        self.pokemonRepository = pokemonRepository
    }
    
    func execute(range: String) -> AnyPublisher<[PokemonModel],PokemonErrors>{
        return pokemonRepository.getOtherPokemons(range: range)
    }
    
}
