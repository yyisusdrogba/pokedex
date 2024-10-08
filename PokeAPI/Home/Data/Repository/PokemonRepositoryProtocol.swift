//
//  PokemonRepositoryProtocol.swift
//  PokeAPI
//
//  Created by Jesus Gonzalez on 27/09/24.
//

import Foundation
import Combine

protocol PokemonRepositoryProtocol {
    func getPokemons() -> AnyPublisher<[PokemonModel],PokemonErrors>
    var apiDataManager: PokemonAPIDataManagerProtocol { get }
    var pokemonMapper: PokemonMapper { get }
}
