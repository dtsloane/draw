//
//  LineWidthPicker.swift
//  draw
//
//  Created by David Sloane on 21/01/2024.
//

import SwiftUI

struct LineWidthPicker: View {
    let lineWidths: [CGFloat] = [2, 5, 8, 12]
    @Binding var selectedLineWidth: CGFloat
    @State private var isExpanded: Bool = false

    var body: some View {
        VStack {
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
    }
}
