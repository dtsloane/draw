//
//  ContentView.swift
//  draw
//
//  Created by David Sloane on 22/12/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = DrawingViewModel()
<<<<<<< HEAD
    @State private var isColorPickerExpanded = false
    @State private var isLineWidthPickerExpanded = false
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
            GeometryReader { geometry in
                ZStack {
                    // Canvas
                    Canvas { context, size in
                        for drawingPath in viewModel.paths {
                            context.stroke(drawingPath.path, with: .color(drawingPath.color), style: StrokeStyle(lineWidth: drawingPath.lineWidth, lineCap: .round, lineJoin: .round))
                        }
                        if let currentPath = viewModel.currentPath {
                            context.stroke(currentPath, with: .color(viewModel.selectedColor), style: StrokeStyle(lineWidth: viewModel.lineWidth, lineCap: .round, lineJoin: .round))
                        }
                    }
                    .gesture(drawingGesture)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .background(Color(.systemBackground))
                    .edgesIgnoringSafeArea(.all)
                    
                    // Toolbar
                    VStack {
                        Spacer() // Pushes the toolbar to the bottom
                        drawingToolbar
                    }
                }
            }
        }
        
    
    private var drawingGesture: some Gesture {
        DragGesture(minimumDistance: 0, coordinateSpace: .local)
            .onChanged { value in
                viewModel.updatePath(value.location)
            }
            .onEnded { _ in
                viewModel.clearCurrentPath()
            }
    }
    
    private var drawingToolbar: some View {
        HStack(alignment: .center, spacing: 25){
            LineWidthPicker(selectedLineWidth: $viewModel.lineWidth)
                .frame(minWidth: 0, maxWidth: .infinity)
            ColorPickerView(selectedColor: $viewModel.selectedColor)
            Spacer()
            Button(action: viewModel.clearAllPaths) {
                Image(systemName: "trash")
                                .foregroundColor(.red)
                                .frame(width: 44, height: 44)
=======

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
>>>>>>> 281c47f2c6a449ca4849f410eef9f639f9a45270
            }
        }
        .padding()
        .background(Color.gray.opacity(0))
        .cornerRadius(20)
<<<<<<< HEAD
        .padding([.horizontal, .bottom], 50)
        .edgesIgnoringSafeArea([.leading, .trailing])
=======
        .padding(.vertical,20)
        .padding(.bottom, 8)
>>>>>>> 281c47f2c6a449ca4849f410eef9f639f9a45270
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// Define your DrawingViewModel, LineWidthPicker, and ColorPickerView in their respective files as previously shown.
