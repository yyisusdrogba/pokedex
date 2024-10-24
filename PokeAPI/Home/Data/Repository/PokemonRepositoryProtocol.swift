//
//  PokemonRepositoryProtocol.swift
//  PokeAPI
//
//  Created by Jesus Gonzalez on 27/09/24.
//

import Foundation
import Combine

protocol PokemonRepositoryProtocol {
    var apiDataManager: PokemonAPIDataManagerProtocol { get }
    var pokemonMapper: PokemonMapper { get }
    func getAllPokemonsInTheRange(range: String) -> AnyPublisher<[Pokemon],Error>
    func pokemonRange() -> [PokemonRange]
}
