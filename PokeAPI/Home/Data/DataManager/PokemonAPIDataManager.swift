//
//  PokemonAPIDataManager.swift
//  PokeAPI
//
//  Created by Jesus Gonzalez on 27/09/24.
//

import Foundation
import Combine

class PokemonAPIDataManager: PokemonAPIDataManagerProtocol{
    
    private let url: URL = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=100")!
    var pokemonErrorMapper: PokemonErrorsMapper
    
    init(pokemonErrorMapper: PokemonErrorsMapper) {
        self.pokemonErrorMapper = pokemonErrorMapper
    }
    
    func PokemonPromiseURL() -> AnyPublisher<PokemonRequestDTO, Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: PokemonRequestDTO.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func pokemonRequestRange(offset: String, limit: String) -> AnyPublisher<PokemonRequestDTO,Error>{
        let urlRange: URL = URL(string: "https://pokeapi.co/api/v2/pokemon?offset=\(offset)&limit=\(limit)")!
        return URLSession.shared.dataTaskPublisher(for: urlRange)
            .map(\.data)
            .decode(type: PokemonRequestDTO.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
}


