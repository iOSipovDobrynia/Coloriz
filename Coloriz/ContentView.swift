//
//  ContentView.swift
//  Coloriz
//
//  Created by Goodwasp on 10.10.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var redValue = Double.random(in: 0...255).rounded()
    @State private var greenValue = Double.random(in: 0...255).rounded()
    @State private var blueValue = Double.random(in: 0...255).rounded()
    
    @FocusState private var isInputActive: Bool
    
    var body: some View {
        ZStack {
            Color(red: 1, green: 1, blue: 1)
                .onTapGesture {
                    isInputActive = false
                }
            VStack {
                Color(red: redValue / 255, green: greenValue / 255, blue: blueValue / 255)
                    .frame(width: 200, height: 200)
                HStack {
                    VStack(spacing: 40) {
                        ColorSliderView(value: $redValue, text: "Red", color: .red)
                        ColorSliderView(value: $greenValue, text: "Green", color: .green)
                        ColorSliderView(value: $blueValue, text: "Blue", color: .blue)
                    }
                    .focused($isInputActive)
                    .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            Spacer()
                            Button("Done", action: { isInputActive = false })
                        }
                    }
                }
                Spacer()
            }
            .padding()
        }
    }
    
    private func checkValue() {

    }
}

#Preview {
    ContentView()
}
