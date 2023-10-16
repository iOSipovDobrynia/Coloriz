//
//  SliderView.swift
//  Coloriz
//
//  Created by Goodwasp on 14.10.2023.
//

import SwiftUI

struct SliderView: View {
    
    @Binding var value: Double
    
    var tintColor: Color
    
    var body: some View {
        Slider(
            value: $value,
            in: 0...255,
            step: 1,
            label: { Text("") },
            minimumValueLabel: { Text("0") },
            maximumValueLabel: { Text("255") }
        )
        .tint(tintColor)
    }
}

#Preview {
    SliderView(value: .constant(100), tintColor: Color.red)
}
