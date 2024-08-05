//
//  MealDetailsViewModel.swift
//  Meals
//
//  Created by Shane Brelesky on 8/4/24.
//

import Foundation
import SwiftUI

@MainActor
class MealDetailsViewModel: ObservableObject {
    
    @Published var details: MealDetails?
    @Published var error: String?
    
    let meal: Meal
    
    init(meal: Meal) {
        self.meal = meal
    }
    
    public func fetchMealDetails() async {
        do {
            details = try await NetworkManager.shared.fetchMealDetails(for: meal.id)
        } catch {
            print("Error: ", error)
            self.error = "Could not fetch meal details. Try again later."
        }
    }
}
