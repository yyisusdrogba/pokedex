//
//  PokemonViewModel.swift
//  PokeAPI
//
//  Created by Jesus Gonzalez on 02/10/24.
//

import Foundation
import Combine

class PokemonViewModel: ObservableObject {
    
    @Published var pokemons: [PokemonModel] = []
    @Published var errorMessage: String = ""
    private var cancellables = Set<AnyCancellable>()
    private let useCasePokemons: PokemonUseCase
    private let useCaseRange: PokemonRangeUseCase
    
    init(useCasePokemons: PokemonUseCase, useCaseRange: PokemonRangeUseCase) {
        self.useCasePokemons = useCasePokemons
        self.useCaseRange = useCaseRange
    }
    
    func getAllPokemons(){
        useCasePokemons.execute()
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
            }
            .store(in: &self.cancellables)
    }
    
    func getOtherRangeOfPokemons(range: String){
        useCaseRange.execute(range: range)
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
            }
            .store(in: &self.cancellables)

    }
    
}
