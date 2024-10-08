//
//  PokemonHome.swift
//  PokeAPI
//
//  Created by Jesus Gonzalez on 04/10/24.
//

import SwiftUI


struct PokemonHome: View {
    
    @ObservedObject var viewModel: PokemonViewModel
    let buttonCustomize: [RangeOfPokemons] = [RangeOfPokemons(title: "103-206", indice: 0),RangeOfPokemons(title: "206-309", indice: 1),RangeOfPokemons(title: "309-412", indice: 2),RangeOfPokemons(title: "412-515", indice: 3),RangeOfPokemons(title: "515-618", indice: 4),RangeOfPokemons(title: "618-721", indice: 5),RangeOfPokemons(title: "721-824", indice: 6),RangeOfPokemons(title: "824-927", indice: 7),RangeOfPokemons(title: "927-1027", indice: 8),]
    
    init(viewModel: PokemonViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack{
            VStack{
                HStack {
                    Image("pokeApi")
                        .resizable()
                        .frame(width: 180, height: 180)
                }
                .padding(EdgeInsets(top: 0.0, leading: 0.0, bottom: -60.0, trailing: 0.0))
                HStack{
                    Menu {
                        ForEach(buttonCustomize, id: \.id) { customize in
                            Button (customize.title) {
                                viewModel.getOtherRangeOfPokemons(range: customize.title)
                            }
                        }
                    } label: {
                        Image(systemName: "list.bullet.rectangle.fill")
                            .font(.system(size: 36))
                            .foregroundStyle(.yellow)
                    }
                }
            }
            .padding(EdgeInsets(top: 10.0, leading: 0.0, bottom: 0.0, trailing: 0.0))
            .shadow(color: .gray, radius: 1.0, x: 3.0, y: 6.0)
            ScrollView{
                HStack (){
                    Spacer()
                        .padding()
                }
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100)),GridItem(.adaptive(minimum: 100))], spacing: 40.0) {
                    ForEach(viewModel.pokemons, id: \.id) { pokemon in
                        VStack {
                            PokemonCard(imageUrl: pokemon.imageURL, name: pokemon.name)
                        }
                    }
                }
            }
            .onAppear(perform: {
                viewModel.getAllPokemons()
            })
            .padding(EdgeInsets(top: 0.0, leading: 10.0, bottom: 0.0, trailing: 4.0))
        }
    }
}

struct PokemonCard: View {
    
    var imageUrl: String
    var name: String
    
    var body: some View {
        ZStack{
            Rectangle()
                .clipShape(.rect(cornerRadius: 20))
                .foregroundStyle(.white)
                .shadow(color: .gray, radius: 2, x: 8, y: 10)
                .shadow(color: .gray, radius: 2, x: 2, y: -0)
            VStack{
                AsyncImage(url: URL(string: imageUrl)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 160, height: 120)
                } placeholder: {
                    ProgressView()
                }
                Text("\(name)")
                    .font(.system(size: 18, weight: .semibold))
                    .padding(.bottom)
            }
        }
        .padding()
    }
}

struct RangeOfPokemons {
    let title: String
    let id: UUID = UUID()
    let indice: Int
}

#Preview {
    let errorMapper = PokemonErrorsMapper()
    let mapper = PokemonMapper()
    let apiDataManager = PokemonAPIDataManager(pokemonErrorMapper: errorMapper)
    let repository = PokemonRepository(apiDataManager: apiDataManager, pokemonMapper: mapper)
    let useCase = PokemonUseCase(pokemonRepository: repository)
    let viewModel = PokemonViewModel(useCasePokemons: useCase, useCaseRange: PokemonRangeUseCase(pokemonRepository: repository))
    PokemonHome(viewModel: viewModel)
}
