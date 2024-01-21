//
//  LineWidthPicker.swift
//  draw
//
//  Created by David Sloane on 21/01/2024.
//

import SwiftUI

struct LineWidthPicker: View {
<<<<<<< HEAD
    let lineWidths: [CGFloat] = [8, 12, 14, 18] // Adjusted the last value from 242 to 24
=======
    let lineWidths: [CGFloat] = [2, 5, 8, 12]
>>>>>>> 281c47f2c6a449ca4849f410eef9f639f9a45270
    @Binding var selectedLineWidth: CGFloat
    @State private var isExpanded: Bool = false

    var body: some View {
        VStack {
<<<<<<< HEAD
            // The button to show and hide the line width options
=======
>>>>>>> 281c47f2c6a449ca4849f410eef9f639f9a45270
            Button(action: {
                withAnimation {
                    isExpanded.toggle()
                }
            }) {
                Image(systemName: "line.horizontal.3.decrease.circle")
                    .imageScale(.large)
                    .rotationEffect(.degrees(isExpanded ? 180 : 0))
                    .scaleEffect(isExpanded ? 1.5 : 1)
                    .padding()
            }

<<<<<<< HEAD
            // The line width options
            if isExpanded {
                VStack {
                    ForEach(lineWidths, id: \.self) { lineWidth in
                        Circle()
                            .frame(width: lineWidth, height: lineWidth)
                            .padding(4)
                            .onTapGesture {
                                selectedLineWidth = lineWidth
                                withAnimation {
                                    isExpanded = false
                                }
                            }
                    }
                }
                .transition(.scale)
            }
        }
    }
}

// Preview for the LineWidthPicker
struct LineWidthPicker_Previews: PreviewProvider {
    static var previews: some View {
        LineWidthPicker(selectedLineWidth: .constant(10))
=======
            if isExpanded {
                ForEach(lineWidths, id: \.self) { lineWidth in
                    Circle()
                        .frame(width: lineWidth, height: lineWidth)
                        .padding(4)
                        .onTapGesture {
                            selectedLineWidth = lineWidth
                            withAnimation {
                                isExpanded = false
                            }
                        }
                }
            }
        }
        .transition(.scale)
>>>>>>> 281c47f2c6a449ca4849f410eef9f639f9a45270
    }
}
