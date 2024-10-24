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
    @Published var buttonCustomize: [PokemonRange] = []
    @Published var errorMessage: String = ""
    private var cancellables = Set<AnyCancellable>()
    private let useCasePokemons: PokemonUseCaseProtocol
    private let useCaseRange: PokemonRangeUseCaseProtocol
    
    init(useCasePokemons: PokemonUseCaseProtocol, useCaseRange: PokemonRangeUseCaseProtocol) {
        self.useCasePokemons = useCasePokemons
        self.useCaseRange = useCaseRange
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
    
    func getRange() {
        DispatchQueue.main.async {
            self.buttonCustomize = self.useCaseRange.execute()
        }
    }
}
