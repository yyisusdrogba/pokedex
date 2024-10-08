//
//  StringExtension.swift
//  PokeAPI
//
//  Created by Jesus Gonzalez on 07/10/24.
//

import Foundation

extension String {
    func obtainOffsetAndLimit() -> (String,String){
        let components = self.components(separatedBy: "-")
        let offset = components[0].trimmingCharacters(in: .whitespaces)
        let limit = components[1].trimmingCharacters(in: .whitespaces)
        let tuplaOfRange = (offset,limit)
        return tuplaOfRange
    }
}
