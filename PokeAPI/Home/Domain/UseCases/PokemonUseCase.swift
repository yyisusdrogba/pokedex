//
//  PokemonUseCase.swift
//  PokeAPI
//
//  Created by Jesus Gonzalez on 02/10/24.
//

import Foundation
import Combine

class PokemonUseCase: PokemonUseCaseProtocol {
    
    var pokemonRepository: PokemonRepositoryProtocol
    
    init(pokemonRepository: PokemonRepositoryProtocol) {
        self.pokemonRepository = pokemonRepository
    }
    
    func execute () -> AnyPublisher<[PokemonModel],PokemonErrors>{
        return pokemonRepository.getPokemons()
    }
}
