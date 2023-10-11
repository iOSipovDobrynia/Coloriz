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
    @State private var alertPresented = false
    
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
                    TextFieldView(placeholder: slidersValue.red, text: $textValue.red)
                    TextFieldView(placeholder: slidersValue.green, text: $textValue.green)
                    TextFieldView(placeholder: slidersValue.blue, text: $textValue.blue)
                }
                .frame(width: 50)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done", action: checkValue)
                            .alert("Wrong format", isPresented: $alertPresented, actions: {}) {
                                Text("Enter all three value")
                            }
                    }
                }
            }
            Spacer()
        }
        .padding()
    }
    
    private func checkValue() {
        guard let redValue = Double(textValue.red), let greenValue = Double(textValue.green), let blueValue = Double(textValue.blue) else {
            alertPresented.toggle()
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

struct TextFieldView: View {
    
    let placeholder: Double
    @Binding var text: String
    
    var body: some View {
        TextField("\(lround(placeholder))", text: $text)
            .textFieldStyle(.roundedBorder)
            .keyboardType(.asciiCapableNumberPad)
    }
}
