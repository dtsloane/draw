//
//  colourpicker.swift
//  draw
//
//  Created by David Sloane on 20/01/2024.
//

import SwiftUI
import UIKit  // Import UIKit

struct ColorPickerView: View {
    let colors: [Color] = [.red, .blue, .purple]
    @Binding var selectedColor: Color
    @State private var isExpanded: Bool = false

    var body: some View {
        VStack {
            Button(action: {
                withAnimation {
                    isExpanded.toggle()
                    triggerHapticFeedback()
                }
            }) {
                RoundedRectangle(cornerRadius: 24)
                    .fill(.orange)
                    .frame(width: 32, height: 32)
            }

            if isExpanded {
                ForEach(colors, id: \.self) { color in
                    RoundedRectangle(cornerRadius: 24)
                        .fill(color)
                        .frame(width: 32, height: 32)
                        .padding(4)
                        .onTapGesture {
                            selectedColor = color
                            isExpanded = false
                            triggerHapticFeedback()
                        }
                }
            }
        }
        .transition(.scale)
    }

    private func triggerHapticFeedback() {
        DispatchQueue.main.async {  // Ensure this runs on the main thread
            let impactMed = UIImpactFeedbackGenerator(style: .medium)
            impactMed.impactOccurred()
        }
    }
}
