//
//  PokemonMapper.swift
//  PokeAPI
//
//  Created by Jesus Gonzalez on 02/10/24.
//

import Foundation

class PokemonMapper {
    func mapp (from model: PokemonResponse) -> PokemonModel {
        PokemonModel(name: model.name ?? "", url: model.url ?? "")
    }
}
