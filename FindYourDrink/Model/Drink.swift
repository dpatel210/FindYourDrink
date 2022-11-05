//
//  Drink.swift
//  FindYourDrink
//
//  Created by Dishant  patel on 11/5/22.
//

import Foundation

// Data in the JSON does not place ingredients and measurements into an array on server side
struct Drink: Codable, Hashable {
    var id: String { idDrink }
    let idDrink: String
    let strDrink: String
    let strTags: String
    let strInstructions: String
    let strDrinkThumb: String
}
