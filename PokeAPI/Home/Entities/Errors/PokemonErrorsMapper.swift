//
//  PokemonErrorsMapper.swift
//  PokeAPI
//
//  Created by Jesus Gonzalez on 02/10/24.
//

import Foundation

class PokemonErrorsMapper {
    func mapAPIErrorPokemon(error: Int) -> PokemonErrors{
        switch error{
        case 400...499:
            return .clientErrorResponse
        case 500...599:
            return .serverErrorResponse
        default:
            return .otherError
        }
    }
}
