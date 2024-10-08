//
//  PokemonAPIDataManagerProtocol.swift
//  PokeAPI
//
//  Created by Jesus Gonzalez on 27/09/24.
//

import Foundation
import Combine

protocol PokemonAPIDataManagerProtocol {
    func PokemonPromiseURL() -> AnyPublisher<PokemonRequestDTO, Error>
    func pokemonRequestRange(offset: String, limit: String) -> AnyPublisher<PokemonRequestDTO,Error>
}
