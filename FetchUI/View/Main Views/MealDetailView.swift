//
//  MealDetailView.swift
//  Meals
//
//  Created by Shane Brelesky on 8/3/24.
//

import SwiftUI

struct MealDetailView: View {
        
    @StateObject var viewModel: MealDetailsViewModel
    
    init(meal: Meal) {
        _viewModel = StateObject(wrappedValue: MealDetailsViewModel(meal: meal))
    }
        
    var body: some View {
        VStack {
            
            if viewModel.error != nil {
                ErrorView(error: $viewModel.error) {
                    Task {
                        await viewModel.fetchMealDetails()
                    }
                }
            }
            else if viewModel.details == nil {
                ProgressView {
                    Text("Loading Details...")
                }
            } else {
                ScrollView(.vertical) {
                    
                    VStack {
                        
                        if let imageUrl = viewModel.details?.imageUrl{
                            MealDetailImageView(imageUrl: imageUrl)
                        }
                        
                        Group {
                            MealDetailHeaderView(mealName: viewModel.meal.name)
                            
                            if let ingredients = viewModel.details?.ingredients {
                                IngredientsList(ingredients: ingredients)
                            }
                            
                            if let instructions = viewModel.details?.instructions {
                                InstructionsView(instructions: instructions)
                            }
                            
                            LinkView(
                                systemImageName: "play.rectangle",
                                title: "Tutorial Video",
                                url: URL(string: viewModel.details?.youtubeUrl ?? "")
                            )
                            
                            LinkView(
                                systemImageName: "globe",
                                title: "Source",
                                url: URL(string: viewModel.details?.sourceUrl ?? "")
                            )
                                                        
                        }
                        .padding([.horizontal, .bottom])
                    }
                }
                .ignoresSafeArea(edges: [.top, .horizontal])
            }
        }
        .task {
            await viewModel.fetchMealDetails()
        }
    }
}

#Preview {
   MealListView()
}
