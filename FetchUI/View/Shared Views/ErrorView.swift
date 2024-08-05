//
//  ErrorView.swift
//  FetchUI
//
//  Created by Shane Brelesky on 8/4/24.
//

import SwiftUI

struct ErrorView: View {
    
    @Binding var error: String?
    var retryAction: (() -> Void)?
    
    var body: some View {
        
        VStack {
            Image(systemName: "exclamationmark.triangle.fill")
                .resizable()
                .frame(width: 60, height: 60)
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(.gray)
            
            Text("Oops!")
                .font(.largeTitle)
                .bold()
                .foregroundStyle(.gray)
                        
            Text(error ?? "Something went wrong")
                .padding(.vertical)
        
                            
            Button("Retry") {
                retryAction?()
            }
            .padding(.vertical)
            .padding(.horizontal, 30)
            .background(Color.fetchOrange)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 5.0))
        }
        .padding()
    }
}

#Preview {
    ErrorView(error: .constant(nil), retryAction: nil)
}
