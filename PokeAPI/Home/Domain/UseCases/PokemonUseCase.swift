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
    
    func execute (range: String) -> AnyPublisher<[Pokemon],Error>{
        return pokemonRepository.getAllPokemonsInTheRange(range: range)
    }
}
