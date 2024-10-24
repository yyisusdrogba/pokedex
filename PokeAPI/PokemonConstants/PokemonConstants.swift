//
//  PokemonConstants.swift
//  PokeAPI
//
//  Created by Jesus Gonzalez on 22/10/24.
//

import Foundation

class PokemonConstants {
    var pokemonLogo: String { return "pokeApi" }
    var listBullet: String { return  "list.bullet.rectangle.fill" }
    var firtsRange: String { return "0-102"}
    
    struct PokemonRangeConstants {
        static var oneToOneHundredTwo: String { return "0-102" }
        static var oneHundredThreeToTwoHundredSix: String { return "103-206" }
        static var twoHundredSixToThreeHundredNine: String { return"206-309" }
        static var threeHundredNineToFourHundredTwelve: String { return "309-412" }
        static var fourHundredTwelveToFiveHundredFifteen: String { return "412-515" }
        static var fiveHundredFifteenToSixHundredEighteen: String { return "515-618" }
        static var sixHundredEighteenToSevenHundredTwenntyOne: String { return "618-721" }
        static var sevenHundredTwentyOneToEightHundredTwentyFour: String { return "721-824" }
        static var eightHundredTwentyFourToNineHundredTwnetySeven: String { return "824-927" }
        static var nineHundredTwentySevenToOneThousandTwentySeven: String { return "927-1027" }
    }
}
