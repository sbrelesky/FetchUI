//
//  MealDetailsKeys.swift
//  FetchUI
//
//  Created by Shane Brelesky on 8/4/24.
//

enum MealDetailCodingKeys: String, CodingKey {
    case id = "idMeal"
    case name = "strMeal"
    case imageUrl = "strMealThumb"
    case origin = "strArea"
    case instructions = "strInstructions"
    case drink = "strDrinkAlternate"
    case tags = "strTags"
    case youtubeUrl = "strYoutube"
    case sourceUrl = "strSource"
}
