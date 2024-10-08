//
//  PokemonTabView.swift
//  PokeAPI
//
//  Created by Jesus Gonzalez on 04/10/24.
//

import SwiftUI

struct PokemonTabView: View {
    
    let pokemonHome: PokemonHome
    
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house.fill") {
                pokemonHome
            }
            Tab("Search", systemImage: "magnifyingglass") {
                Text("busqueda")
            }
        }
        .tint(.yellow)
    }
}

#Preview {
    let errorMapper = PokemonErrorsMapper()
    let mapper = PokemonMapper()
    let apiDataManager = PokemonAPIDataManager(pokemonErrorMapper: errorMapper)
    let repository = PokemonRepository(apiDataManager: apiDataManager, pokemonMapper: mapper)
    let useCase = PokemonUseCase(pokemonRepository: repository)
    let viewModel = PokemonViewModel(useCasePokemons: useCase, useCaseRange: PokemonRangeUseCase(pokemonRepository: repository))
    let pokemonHome = PokemonHome(viewModel: viewModel)
    PokemonTabView(pokemonHome: pokemonHome)}
