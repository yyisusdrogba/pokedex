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
    
    func getPokemons() -> AnyPublisher<[PokemonModel],PokemonErrors>{
        apiDataManager.PokemonPromiseURL()
            .tryMap { response in
                guard let results = response.results else {
                    throw PokemonErrors.otherError
                }
                return results.map { self.pokemonMapper.mapp(from: $0)}
            }
            .mapError { error -> PokemonErrors in
                return error as? PokemonErrors ?? .otherError
            }
            .eraseToAnyPublisher()
    }
    
    func getOtherPokemons(range: String) -> AnyPublisher<[PokemonModel],PokemonErrors>{
        let (offset,limit) = range.obtainOffsetAndLimit()
        return apiDataManager.pokemonRequestRange(offset: String(offset), limit: String(limit))
            .tryMap { response in
                guard let results = response.results else {
                    throw PokemonErrors.otherError
                }
                return results.map { self.pokemonMapper.mapp(from: $0) }
            }
            .mapError { error -> PokemonErrors in
                return error as? PokemonErrors ?? .otherError
            }
            .eraseToAnyPublisher()
    }
}


