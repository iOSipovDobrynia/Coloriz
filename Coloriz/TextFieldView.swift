//
//  TextFieldView.swift
//  Coloriz
//
//  Created by Goodwasp on 14.10.2023.
//

import SwiftUI

struct TextFieldView: View {
    
    @Binding var text: String
    @Binding var value: Double
    var action: () -> Void
    
    var body: some View {
        TextField("", text: $text) { _ in
            withAnimation {
                action()
            }
        }
            .textFieldStyle(.roundedBorder)
            .keyboardType(.asciiCapableNumberPad)
            .frame(width: 50)
    }
}

#Preview {
    TextFieldView(text: .constant("1200"), value: .constant(100), action: {} )
}
