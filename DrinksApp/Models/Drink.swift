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
    
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
    
    var description: String {
        """
    Ingredients:
    1. \(strIngredient1 ?? "") - \(strMeasure1 ?? "")
    2. \(strIngredient2 ?? "") - \(strMeasure2 ?? "")
    3. \(strIngredient3 ?? "") - \(strMeasure3 ?? "")
    4. \(strIngredient4 ?? "") - \(strMeasure4 ?? "")
    5. \(strIngredient5 ?? "") - \(strMeasure5 ?? "")
    6. \(strIngredient6 ?? "") - \(strMeasure6 ?? "")
    7. \(strIngredient7 ?? "") - \(strMeasure7 ?? "")
    
    Instructions:
    \(strInstructions)
    """
    }
}

struct AboutDrinks: Decodable {
    let drinks: [Drink]

}

enum Link: String {
    case drinksURL = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita"
}


