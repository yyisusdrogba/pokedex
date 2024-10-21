//
//  PokemonViewModel.swift
//  PokeAPI
//
//  Created by Jesus Gonzalez on 02/10/24.
//

import Foundation
import Combine

class PokemonViewModel: ObservableObject {
    
    @Published var pokemons: [Pokemon] = []
    @Published var errorMessage: String = ""
    private var cancellables = Set<AnyCancellable>()
    private let useCasePokemons: PokemonUseCase
    
    init(useCasePokemons: PokemonUseCase) {
        self.useCasePokemons = useCasePokemons
    }
    
    func getAllPokemons(range: String){
        useCasePokemons.execute(range: range)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion{
                case .finished:
                    break
                case .failure(let error):
                    self.errorMessage = "Error \(error)"
                    print(error)
                }
            } receiveValue: { pokemon in
                self.pokemons = pokemon
                print(pokemon)
            }
            .store(in: &self.cancellables)
    }
}
