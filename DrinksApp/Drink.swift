//
//  Drink.swift
//  DrinksApp
//
//  Created by Aleksandr on 18.10.2022.
//

import Foundation

struct Drink: Decodable {
    let strDrink: String
    let strGlass: String
    let strInstructions: String
    let strDrinkThumb: String
}

struct AboutDrinks: Decodable {
    let drinks: [Drink]

}

enum Link: String {
    case drinksURL = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita"
}


