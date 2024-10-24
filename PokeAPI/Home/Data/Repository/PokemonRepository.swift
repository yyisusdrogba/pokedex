//
//  PokemonRepository.swift
//  PokeAPI
//
//  Created by Jesus Gonzalez on 27/09/24.
//

import Foundation
import Combine

class PokemonRepository: PokemonRepositoryProtocol{
    
    var apiDataManager: PokemonAPIDataManagerProtocol
    var pokemonMapper: PokemonMapper
    
    init(apiDataManager: PokemonAPIDataManager, pokemonMapper: PokemonMapper) {
        self.apiDataManager = apiDataManager
        self.pokemonMapper = pokemonMapper
    }
    
    func getAllPokemonsInTheRange(range: String) -> AnyPublisher<[Pokemon],Error>{
        let (offset,limit) = range.obtainOffsetAndLimit()
        return apiDataManager.pokemonRange(offset: offset, limit: limit)
            .flatMap { urls in
                Publishers.MergeMany(urls.map{ url in
                    self.apiDataManager.pokemonRequestAPI(url: url)
                        .compactMap { $0.first }
                })
                .collect()
            }
            .eraseToAnyPublisher()
    }
    
    func pokemonRange() -> [PokemonRange] {
        return apiDataManager.pokemonRequestRange()
    }
    
}


