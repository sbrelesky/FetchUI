//
//  ColorScheme.swift
//  FetchUI
//
//  Created by Shane Brelesky on 8/5/24.
//

import SwiftUI

struct ColorSchemeModifier: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    let color: Color

    func body(content: Content) -> some View {
        content
            .foregroundColor(colorScheme == .dark ? .white : color)
    }
}
