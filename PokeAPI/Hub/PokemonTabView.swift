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
    let apiDataManager = PokemonAPIDataManager()
    let mapper = PokemonMapper()
    let repository = PokemonRepository(apiDataManager: apiDataManager, pokemonMapper: mapper)
    let useCase = PokemonUseCase(pokemonRepository: repository)
    let viewModel = PokemonViewModel(useCasePokemons: useCase)
    let pokemonHome = PokemonHome(viewModel: viewModel)
    PokemonTabView(pokemonHome: pokemonHome)
}
