//
//  ContentView.swift
//  Coloriz
//
//  Created by Goodwasp on 10.10.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var slidersValue = (red: Double.random(in: 0...255), green: Double.random(in: 0...255), blue: Double.random(in: 0...255))
    
    var body: some View {
        VStack {
            Color(red: slidersValue.red / 255, green: slidersValue.green / 255, blue: slidersValue.blue / 255)
                .frame(width: 100, height: 100)
            HStack {
                VStack(alignment: .leading, spacing: 40) {
                    Text("Red")
                    Text("Green")
                    Text("Blue")
                }
                VStack(spacing: 40) {
                    Text("\(lround(slidersValue.red))")
                    Text("\(lround(slidersValue.green))")
                    Text("\(lround(slidersValue.blue))")
                }
                .frame(width: 50)
                VStack(spacing: 30) {
                    SliderView(value: $slidersValue.red, color: Color.red)
                    SliderView(value: $slidersValue.green, color: Color.green)
                    SliderView(value: $slidersValue.blue)
                }
//                VStack(alignment: .leading, spacing: 40) {
//                    Text("Red")
//                    Text("Green")
//                    Text("Blue")
//                }
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

struct SliderView: View {
    
    @Binding var value: Double
    
    var color: Color = Color.blue
    
    var body: some View {
        Slider(
            value: $value,
            in: 0...255,
            label: { Text("") },
            minimumValueLabel: { Text("0") },
            maximumValueLabel: { Text("255") }
        )
        .tint(color)
    }
}
