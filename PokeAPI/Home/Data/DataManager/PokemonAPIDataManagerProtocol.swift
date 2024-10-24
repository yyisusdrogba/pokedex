//
//  PokemonAPIDataManagerProtocol.swift
//  PokeAPI
//
//  Created by Jesus Gonzalez on 27/09/24.
//

import Foundation
import Combine

protocol PokemonAPIDataManagerProtocol {
    func pokemonRange(offset: String,limit: String) -> AnyPublisher<[String],Error>
    func pokemonRequestAPI(url: String) -> AnyPublisher<[Pokemon],Error>
    func pokemonRequestRange() -> [PokemonRange] 
}
