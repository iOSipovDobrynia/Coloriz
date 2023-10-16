//
//  ColorSliderView.swift
//  Coloriz
//
//  Created by Goodwasp on 14.10.2023.
//

import SwiftUI

struct ColorSliderView: View {
    @Binding var value: Double
    @State private var alertPresented = false
    @State private var textTF = ""
    
    var text: String
    var color: Color

    var body: some View {
        HStack() {
            Text(text)
                .frame(width: 50, alignment: .leading)
            SliderView(value: $value, tintColor: color)
                .onChange(of: value) { _, newValue in
                    textTF = newValue.formatted()
                }
            TextFieldView(text: $textTF, value: $value, action: checkValue)
                .alert("Wrong format", isPresented: $alertPresented, actions: {}) {
                    Text("Enter value between 0 and 255")
                }
        }
        .onAppear {
            textTF = value.formatted()
        }
    }
    
    private func checkValue() {
        if let value = Int(textTF), (0...255).contains(value) {
            self.value = Double(value)
            return
        }
        
        alertPresented.toggle()
        value = 0
        textTF = ""
    }
}

#Preview {
    ColorSliderView(value: .constant(100), text: "Green", color: .red)
}
