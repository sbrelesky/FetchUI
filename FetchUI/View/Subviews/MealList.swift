//
//  MealListView.swift
//  Meals
//
//  Created by Shane Brelesky on 8/4/24.
//

import SwiftUI

struct MealList: View  {
    
    @Binding var meals: [Meal]
    
    var body: some View {
        List(meals, id: \.id) { meal in
            NavigationLink(value: meal) {
                HStack {
                    if let url = URL(string: meal.imageUrl) {
                        AsyncImage(url: url) { image in
                            image
                                .resizable()
                        } placeholder: {
                            RoundedRectangle(cornerRadius: 5.0)
                                .foregroundStyle(.regularMaterial)
                        }
                        .frame(width: 60, height: 60)
                        .clipShape(RoundedRectangle(cornerRadius: 5.0))
                    }
                    
                    Text(meal.name)
                }
            }            
        }
    }
}
