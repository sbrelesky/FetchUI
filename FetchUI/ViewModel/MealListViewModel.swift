//
//  MealListViewModel.swift
//  Meals
//
//  Created by Shane Brelesky on 8/4/24.
//

import Foundation
import SwiftUI

@MainActor
class MealListViewModel: ObservableObject {
    
    @Published var searchText = ""
    @Published var filteredMeals: [Meal] = []
    @Published var error: String?
    
    private var meals: [Meal] = []
    
    public func fetchMeals() async {
        do {
            meals = try await NetworkManager.shared.fetchMeals()
            filteredMeals = meals
        } catch {
            self.error = "Failed to fetch meals. Please try again later."
        }
    }
    
    public func filterMeals() {        
        if searchText.isEmpty {
            filteredMeals = meals
        } else {
            filteredMeals = meals.filter { meal in
                meal.name.lowercased().contains(searchText.lowercased())
            }
        }
    }
}
