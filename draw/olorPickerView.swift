//
//  colourpicker.swift
//  draw
//
//  Created by David Sloane on 20/01/2024.
//

import SwiftUI

struct ColorPickerView: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .yellow, .purple, .pink]
    @Binding var selectedColor: Color
    @State private var isExpanded: Bool = false

    var body: some View {
        VStack {
            Button(action: {
                withAnimation {
                    isExpanded.toggle()
                }
            }) {
                RoundedRectangle(cornerRadius: 16)
                    .fill(selectedColor)
                    .frame(width: 40, height: 40)
                    .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.black, lineWidth: 2))
            }

            if isExpanded {
                ForEach(colors, id: \.self) { color in
                    RoundedRectangle(cornerRadius: 16)
                        .fill(color)
                        .frame(width: 40, height: 40)
                        .padding(2)
                        .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.black, lineWidth: 1))
                        .onTapGesture {
                            selectedColor = color
                            isExpanded = false
                        }
                }
            }
        }
        .transition(.scale)
    }
}
