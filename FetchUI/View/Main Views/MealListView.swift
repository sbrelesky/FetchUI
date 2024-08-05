//
//  ContentView.swift
//  Meals
//
//  Created by Shane Brelesky on 7/30/24.
//

import SwiftUI

struct MealListView: View {
    
    @StateObject var viewModel = MealListViewModel()
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor(named: "fetchOrange") ?? .systemOrange
        ]
    }
    
    var body: some View {
        VStack {
            
            if viewModel.error != nil {
                ErrorView(error: $viewModel.error) {
                    Task {
                        await viewModel.fetchMeals()
                    }
                }
            } else if viewModel.filteredMeals.isEmpty {
                ProgressView {
                    Text("Loading meals...")
                }
                
            }else {
                NavigationStack {
                    VStack {
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundStyle(.fetchOrange)
                            
                            TextField("Search", text: $viewModel.searchText)
                                .padding()
                                .tint(.fetchOrange)
                                .onChange(of: viewModel.searchText) { _, _ in
                                    viewModel.filterMeals()
                                }
                        }
                        .padding(.horizontal, 10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.clear)
                                .stroke(Color.orange)
                            
                        )
                        .padding()
                        
                        MealList(meals: $viewModel.filteredMeals)
                            .listStyle(.plain)
                            .navigationDestination(for: Meal.self, destination: { meal in
                                MealDetailView(meal: meal)
                            })
                            
                                                
                    }
                    .navigationTitle("Desserts")
                }
            }
        }
        .tint(.fetchOrange)
        .ignoresSafeArea(edges: .bottom)
        .task {
            await viewModel.fetchMeals()
        }
    }
}

#Preview {
    MealListView()
}


