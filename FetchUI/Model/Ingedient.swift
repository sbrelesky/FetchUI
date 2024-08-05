//
//  Ingedient.swift
//  Meals
//
//  Created by Shane Brelesky on 7/30/24.
//

import Foundation

struct Ingredient: Codable, Identifiable {
    
    var id = UUID()
    let name: String
    let measurement: Measurement
}
