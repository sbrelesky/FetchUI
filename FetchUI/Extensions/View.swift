//
//  View.swift
//  FetchUI
//
//  Created by Shane Brelesky on 8/5/24.
//

import SwiftUI

extension View {
    func applyColorSchemeStyle(color: Color) -> some View {
        self.modifier(ColorSchemeModifier(color: color))
    }
}
