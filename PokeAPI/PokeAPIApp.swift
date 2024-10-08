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
            let errorMapper = PokemonErrorsMapper()
            let mapper = PokemonMapper()
            let apiDataManager = PokemonAPIDataManager(pokemonErrorMapper: errorMapper)
            let repository = PokemonRepository(apiDataManager: apiDataManager, pokemonMapper: mapper)
            let useCase = PokemonUseCase(pokemonRepository: repository)
            let viewModel = PokemonViewModel(useCasePokemons: useCase, useCaseRange: PokemonRangeUseCase(pokemonRepository: repository))
            let pokemonHome = PokemonHome(viewModel: viewModel)
            PokemonTabView(pokemonHome: pokemonHome)
        }
    }
}
