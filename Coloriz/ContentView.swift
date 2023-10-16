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
    
    @FocusState private var activeField: Field?
    
    var body: some View {
        ZStack {
            Color(red: 1, green: 1, blue: 1)
                .onTapGesture {
                    activeField = nil
                }
            VStack {
                Color(red: redValue / 255, green: greenValue / 255, blue: blueValue / 255)
                    .frame(width: 200, height: 200)
                HStack {
                    VStack(spacing: 40) {
                        ColorSliderView(value: $redValue, text: "Red", color: .red)
                            .focused($activeField, equals: .red)
                        ColorSliderView(value: $greenValue, text: "Green", color: .green)
                            .focused($activeField, equals: .green)
                        ColorSliderView(value: $blueValue, text: "Blue", color: .blue)
                            .focused($activeField, equals: .blue)
                    }
                    .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            Button("Up", action: nextField)
                            Button("Down", action: previousField)
                            Spacer()
                            Button("Done", action: { activeField = nil })
                        }
                    }
                }
                Spacer()
            }
            .padding()
        }
    }
    
    private func previousField() {
        switch activeField {
        case .red:
            activeField = .green
        case .green:
            activeField = .blue
        case .blue:
            activeField = .red
        case .none:
            activeField = .none
        }
    }
    
    private func nextField() {
        switch activeField {
        case .red:
            activeField = .blue
        case .green:
            activeField = .red
        case .blue:
            activeField = .green
        case .none:
            activeField = .none
        }
    }
}

#Preview {
    ContentView()
}

enum Field {
    case red, green, blue
}
