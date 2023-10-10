//
//  ContentView.swift
//  Coloriz
//
//  Created by Goodwasp on 10.10.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var slidersValue = (red: Double.random(in: 0...255), green: Double.random(in: 0...255), blue: Double.random(in: 0...255))
    @State private var textValue = (red: "", green: "", blue: "")
    
    var body: some View {
        VStack {
            Color(red: slidersValue.red / 255, green: slidersValue.green / 255, blue: slidersValue.blue / 255)
                .frame(width: 200, height: 200)
            HStack {
                VStack(alignment: .leading, spacing: 40) {
                    Text("Red")
                    Text("Green")
                    Text("Blue")
                }
                VStack(spacing: 30) {
                    SliderView(value: $slidersValue.red, tintColor: Color.red)
                    SliderView(value: $slidersValue.green, tintColor: Color.green)
                    SliderView(value: $slidersValue.blue)
                }
                VStack(spacing: 30) {
                    TextField("\(lround(slidersValue.red))", text: $textValue.red)
                        .textFieldStyle(.roundedBorder)
                    TextField("\(lround(slidersValue.green))", text: $textValue.green)
                        .textFieldStyle(.roundedBorder)
                    TextField("\(lround(slidersValue.blue))", text: $textValue.blue)
                        .textFieldStyle(.roundedBorder)
                }
                .frame(width: 50)
                .toolbar(content: {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done", action: checkValue)
                    }
                })
            }
            Spacer()
        }
        .padding()
    }
    
    private func checkValue() {
        guard let redValue = Double(textValue.red), let greenValue = Double(textValue.green), let blueValue = Double(textValue.blue) else {
            textValue = ("", "", "")
            return
        }
        
        slidersValue = (redValue, greenValue, blueValue)
    }
}

#Preview {
    ContentView()
}

struct SliderView: View {
    
    @Binding var value: Double
    
    var tintColor: Color = Color.blue
    
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
