//
//  Meal.swift
//  Meals
//
//  Created by Shane Brelesky on 7/30/24.
//

struct Meal: Codable, Hashable {
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case _name = "strMeal"
        case imageUrl = "strMealThumb"
    }
    
    let id: String
    private let _name: String
    let imageUrl: String
    
    var name: String {
        return _name.capitalized
    }
}
