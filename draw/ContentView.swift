//
//  ContentView.swift
//  draw
//
//  Created by David Sloane on 22/12/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = DrawingViewModel()

    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            VStack {
                Spacer() // Push everything to the bottom
                drawingCanvas
                drawingToolbar
            }
        }
    }

    private var drawingCanvas: some View {
        Canvas { context, size in
            for drawingPath in viewModel.paths {
                context.stroke(drawingPath.path, with: .color(drawingPath.color), lineWidth: drawingPath.lineWidth)
            }
            if let currentPath = viewModel.currentPath {
                context.stroke(currentPath, with: .color(viewModel.selectedColor), lineWidth: viewModel.lineWidth)
            }
        }
        .gesture(drawingGesture)
    }

    private var drawingGesture: some Gesture {
        DragGesture(minimumDistance: 0, coordinateSpace: .local)
            .onChanged { point in viewModel.updatePath(point.location) }
            .onEnded { _ in viewModel.clearCurrentPath() }
    }

    private var drawingToolbar: some View {
        HStack { // Hertical stack for the toolbar
            LineWidthPicker(selectedLineWidth: $viewModel.lineWidth)

            ColorPickerView(selectedColor: $viewModel.selectedColor)

            Button(action: viewModel.clearAllPaths) {
                Image(systemName: "trash").foregroundColor(.black)
            }
        }
        .padding()
        .background(Color.gray.opacity(0))
        .cornerRadius(20)
        .padding(.vertical,20)
        .padding(.bottom, 8)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
