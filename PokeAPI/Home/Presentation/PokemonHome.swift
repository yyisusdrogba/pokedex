//
//  PokemonHome.swift
//  PokeAPI
//
//  Created by Jesus Gonzalez on 04/10/24.
//

import SwiftUI


struct PokemonHome: View {
    
    @ObservedObject var viewModel: PokemonViewModel

    init(viewModel: PokemonViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack{
            VStack{
                HStack {
                    Image(PokemonConstants().pokemonLogo)
                        .resizable()
                        .frame(width: 120, height: 120)
                }
                .padding(EdgeInsets(top: 0.0, leading: 0.0, bottom: -20.0, trailing: 0.0))
                HStack{
                    Menu {
                        ForEach(viewModel.buttonCustomize, id: \.id) { customize in
                            Button (customize.title) {
                                viewModel.getAllPokemons(range: customize.title)
                            }
                        }
                    } label: {
                        Image(systemName: PokemonConstants().listBullet)
                            .font(.system(size: 36))
                            .foregroundStyle(.yellow)
                    }
                }
                .padding(.bottom)
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
                            PokemonCard(imageUrl: pokemon.imageURL, name: pokemon.name, type: pokemon.types)
                        }
                    }
                }
            }
            .onAppear(perform: {
                viewModel.getAllPokemons(range: PokemonConstants().firtsRange)
                viewModel.getRange()
            })
            .padding(EdgeInsets(top: 0.0, leading: 10.0, bottom: 0.0, trailing: 4.0))
        }
    }
}

struct PokemonCard: View {
    
    var imageUrl: String
    var name: String
    var type: String

    var body: some View {
        ZStack{
            Rectangle()
                .clipShape(.rect(cornerRadius: 20))
                .foregroundStyle(.black)
                .shadow(color: .gray, radius: 2, x: 8, y: 10)
                .shadow(color: .gray, radius: 2, x: 2, y: -0)
            VStack{
                ZStack{
                    Circle()
                        .foregroundStyle(.gray)
                        .opacity(0.2)
                        .frame(width: 140, height: 140)
                    VStack{
                        AsyncImage(url: URL(string: imageUrl)) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 160, height: 120)
                        } placeholder: {
                            ProgressView()
                        }
                    }
                }
                .padding(.top)
                Text("\(name)")
                    .font(.custom("HelveticaNeue-Light", size: .init(20)))
                    .foregroundStyle(.white)
                    .padding(.bottom)
                HStack{
                    Image(type)
                        .resizable()
                        .frame(width:26 , height: 26)
                    Image("\(type)DPP")
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 12, trailing: 0))
            }
        }
        .padding()
    }
}


#Preview {
    let apiDataManager = PokemonAPIDataManager()
    let mapper = PokemonMapper()
    let repository = PokemonRepository(apiDataManager: apiDataManager, pokemonMapper: mapper)
    let useCase = PokemonUseCase(pokemonRepository: repository)
    let useCaseRange = PokemonRangeUseCase(pokemonRepository: repository)
    let viewModel = PokemonViewModel(useCasePokemons: useCase, useCaseRange: useCaseRange)
    PokemonHome(viewModel: viewModel)
}
