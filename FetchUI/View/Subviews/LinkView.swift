//
//  LinkView.swift
//  FetchUI
//
//  Created by Shane Brelesky on 8/4/24.
//

import SwiftUI

struct LinkView: View {
    let systemImageName: String
    let title: String
    let url: URL?
    
    var body: some View {
        if let url = url {
            Link(destination: url) {
                HStack {
                    Image(systemName: systemImageName)
                        .foregroundStyle(.orange)
                    Text(title)
                    Spacer()
                }
            }
            .foregroundStyle(.primary)
        } else {
            HStack {
                Image(systemName: systemImageName)
                    .foregroundStyle(.gray)
                Text(title)
                Spacer()
            }
        }
    }
}
