//
//  MealDetailHeaderView.swift
//  FetchUI
//
//  Created by Shane Brelesky on 8/4/24.
//

import SwiftUI

struct MealDetailHeaderView: View {
    let mealName: String
    
    var body: some View {
        VStack(alignment: .center) {
            Text(mealName)
                .font(.largeTitle)
                .bold()
                .foregroundStyle(.fetchOrange)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            Text("Dessert")
                .font(.system(size: 14.0, weight: .light))
                .foregroundStyle(.gray)
        }
//        .padding()
//        .background(Color.white)
//        .clipShape(RoundedRectangle(cornerRadius: 10.0))
//        .shadow(radius: 6.0)
    }
}

