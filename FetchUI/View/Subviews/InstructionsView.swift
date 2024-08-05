//
//  InstructionsView.swift
//  FetchUI
//
//  Created by Shane Brelesky on 8/4/24.
//

import SwiftUI

struct InstructionsView: View {
    let instructions: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Instructions")
                .font(.title2)
                .bold()
                .applyColorSchemeStyle(color: .fetchPurple)
            
            Text(instructions)
                .padding(.top, 5)
        }
    }
}
