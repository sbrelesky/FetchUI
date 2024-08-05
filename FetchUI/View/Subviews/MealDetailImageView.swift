//
//  MealDetailImageView.swift
//  FetchUI
//
//  Created by Shane Brelesky on 8/4/24.
//

import SwiftUI

struct MealDetailImageView: View {
    let imageUrl: String?
    
    var body: some View {
        
        if let imageUrl = imageUrl, let url = URL(string: imageUrl) {
            
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    
            } placeholder: {
                RoundedRectangle(cornerRadius: 20.0)
                    .foregroundStyle(.regularMaterial)
            }
            .frame(maxWidth: .infinity)
            .aspectRatio(contentMode: .fill)
            .clipShape(RoundedRectangle(cornerRadius: 20.0))
        }
    }
}
