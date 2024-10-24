//
//  PokeAPIApp.swift
//  PokeAPI
//
//  Created by Jesus Gonzalez on 26/09/24.
//

import SwiftUI

@main
struct PokeAPIApp: App {
    var body: some Scene {
        WindowGroup {
            let mapper = PokemonMapper()
            let apiDataManager = PokemonAPIDataManager()
            let repository = PokemonRepository(apiDataManager: apiDataManager, pokemonMapper: mapper)
            let useCase = PokemonUseCase(pokemonRepository: repository)
            let range = PokemonRangeUseCase(pokemonRepository: repository)
            let viewModel = PokemonViewModel(useCasePokemons: useCase, useCaseRange: range)
            let pokemonHome = PokemonHome(viewModel: viewModel)
            PokemonTabView(pokemonHome: pokemonHome)
        }
    }
}
