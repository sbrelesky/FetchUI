//
//  NetworkManager.swift
//  Meals
//
//  Created by Shane Brelesky on 7/30/24.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    private let baseUrl = "https://themealdb.com/api/json/v1/1"

    func fetchMeals() async throws -> [Meal] {
        let urlString = "\(baseUrl)/filter.php?c=Dessert"
        guard let url = URL(string: urlString) else {
            throw NetworkError.badURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(Response<Meal>.self, from: data)
        return response.meals
    }

    func fetchMealDetails(for id: String) async throws -> MealDetails? {
        let urlString = "\(baseUrl)/lookup.php?i=\(id)"
        guard let url = URL(string: urlString) else {
            throw NetworkError.badURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let dessertDetails = try JSONDecoder().decode(Response<MealDetails>.self, from: data)
        return dessertDetails.meals.first
    }

//    func downloadImage(from url: URL) async throws -> UIImage? {
//        let (data, _) = try await URLSession.shared.data(from: url)
//        print("Downloaded image")
//        return UIImage(data: data)
//    }
}
