//
//  PokemonUseCaseProtocol.swift
//  PokeAPI
//
//  Created by Jesus Gonzalez on 03/10/24.
//

import Foundation
import Combine

protocol PokemonUseCaseProtocol {
    func execute (range: String) -> AnyPublisher<[Pokemon],Error>
    var pokemonRepository: PokemonRepositoryProtocol { get }
}
