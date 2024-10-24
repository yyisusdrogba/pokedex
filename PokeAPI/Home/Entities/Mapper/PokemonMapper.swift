//
//  PokemonMapper.swift
//  PokeAPI
//
//  Created by Jesus Gonzalez on 02/10/24.
//

import Foundation

class PokemonMapper {

    func mapp(model: PokemonModel) -> [Pokemon]{
        return model.types.map { types in
            Pokemon(name: model.name, id: model.id, types: types.name)
        }
    }
}
