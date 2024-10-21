//
//  PokemonRepositoryProtocol.swift
//  PokeAPI
//
//  Created by Jesus Gonzalez on 27/09/24.
//

import Foundation
import Combine

protocol PokemonRepositoryProtocol {
    func getAllPokemonsInTheRange(range: String) -> AnyPublisher<[Pokemon],Error>
    var apiDataManager: PokemonAPIDataManagerProtocol { get }
    var pokemonMapper: PokemonMapper { get }
}
