//
//  PokemonModel.swift
//  PokeAPI
//
//  Created by Jesus Gonzalez on 26/09/24.
//

import Foundation

struct PokemonModel: Decodable{
    let name: String
    let id: Int
    let types: [PokemonType]
    var imageURL: String {
        "https://raw.githubusercontent.com/PokeAPI/sprites/refs/heads/master/sprites/pokemon/\(String(id)).png"
    }
}

struct PokemonType: Decodable{
    let name: String
    
    enum CodingKeys: CodingKey {
        case type
        case name
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .type)
        self.name = try type.decode(String.self, forKey: .name)
    }
    
}
