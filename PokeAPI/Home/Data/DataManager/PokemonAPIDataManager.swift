//
//  PokemonAPIDataManager.swift
//  PokeAPI
//
//  Created by Jesus Gonzalez on 27/09/24.
//

import Foundation
import Combine

class PokemonAPIDataManager: PokemonAPIDataManagerProtocol{
    
    let mapper: PokemonMapper = PokemonMapper()

    func pokemonRange(offset: String,limit: String) -> AnyPublisher<[String],Error>{
        let urlRange: URL = URL(string: "https://pokeapi.co/api/v2/pokemon?offset=\(offset)&limit=\(limit)")!
        return URLSession.shared.dataTaskPublisher(for: urlRange)
            .map(\.data)
            .decode(type: PokemonRequestDTO.self, decoder: JSONDecoder())
            .map{ dto in
                dto.results.compactMap{ $0.url } 
            }
            .eraseToAnyPublisher()
    }

    func pokemonRequestAPI(url: String) -> AnyPublisher<[Pokemon],Error>{
        let urlPokemon: URL = URL(string: url)!
        return URLSession.shared.dataTaskPublisher(for: urlPokemon)
            .map(\.data)
            .decode(type: PokemonModel.self, decoder: JSONDecoder())
            .map{ self.mapper.mapp(model: $0) }
            .eraseToAnyPublisher()
    }
    
    func pokemonRequestRange() -> [PokemonRange] {
        return  [
            PokemonRange(title: PokemonConstants.PokemonRangeConstants.oneToOneHundredTwo),
            PokemonRange(title: PokemonConstants.PokemonRangeConstants.oneHundredThreeToTwoHundredSix),
            PokemonRange(title: PokemonConstants.PokemonRangeConstants.twoHundredSixToThreeHundredNine),
            PokemonRange(title: PokemonConstants.PokemonRangeConstants.threeHundredNineToFourHundredTwelve),
            PokemonRange(title: PokemonConstants.PokemonRangeConstants.fourHundredTwelveToFiveHundredFifteen),
            PokemonRange(title: PokemonConstants.PokemonRangeConstants.fiveHundredFifteenToSixHundredEighteen),
            PokemonRange(title: PokemonConstants.PokemonRangeConstants.sixHundredEighteenToSevenHundredTwenntyOne),
            PokemonRange(title: PokemonConstants.PokemonRangeConstants.sevenHundredTwentyOneToEightHundredTwentyFour),
            PokemonRange(title: PokemonConstants.PokemonRangeConstants.eightHundredTwentyFourToNineHundredTwnetySeven),
            PokemonRange(title: PokemonConstants.PokemonRangeConstants.nineHundredTwentySevenToOneThousandTwentySeven)]
    }
}


