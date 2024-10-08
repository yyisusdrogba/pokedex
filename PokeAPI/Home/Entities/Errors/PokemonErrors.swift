//
//  PokemonErrors.swift
//  PokeAPI
//
//  Created by Jesus Gonzalez on 02/10/24.
//

import Foundation

enum PokemonErrors: String,Error {
    case badUrlSession = "URL error"
    case clientErrorResponse = "Client Error Response"
    case serverErrorResponse = "Server Error Response"
    case otherError = "Unknow Error"
}
