//
//  IngredientsList.swift
//  FetchUI
//
//  Created by Shane Brelesky on 8/4/24.
//

import SwiftUI

struct IngredientsList: View {
    
    var ingredients: [Ingredient]
    
    var body: some View {
        HStack {
            Text("Ingredients")
                .font(.title2)
                .bold()
                .applyColorSchemeStyle(color: .fetchPurple)
            
            Spacer()
        }
        
        ForEach(ingredients) { ingredient in
            HStack {
                Text(ingredient.name)
                
                Spacer()
                
                HStack {
                    Text(ingredient.measurement.primaryValue)
                        .font(.system(size: 22.0, weight: .black))
                    
                    if let secondary = ingredient.measurement.secondaryValue {
                        Text("(\(secondary))")
                            .font(.system(size: 20.0))
                    }
                }
                .foregroundStyle(.fetchOrange)
            }
        }
    }
}

