//
//  ContentView.swift
//  draw
//
//  Created by David Sloane on 22/12/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedColor: Color = .black
    @State private var lineWidth: CGFloat = 5
    @State private var paths: [Path] = []
    @State private var currentPath: Path = Path()

    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)

            VStack {
                Spacer() // push everything below to the bottom
                drawingCanvas
                drawingToolbar
            }
        }
    }

    private var drawingCanvas: some View {
        Canvas { context, size in
            for path in paths {
                context.stroke(path, with: .color(selectedColor), lineWidth: lineWidth)
            }
            context.stroke(currentPath, with: .color(selectedColor), lineWidth: lineWidth)
        }
        .gesture(drawingGesture)
    }

    private var drawingGesture: some Gesture {
        DragGesture(minimumDistance: 0, coordinateSpace: .local)
            .onChanged(updatePath)
            .onEnded(clearCurrentPath)
    }

    private func updatePath(_ value: DragGesture.Value) {
        let newPoint = value.location
        if currentPath.isEmpty {
            currentPath.move(to: newPoint)
        } else {
            currentPath.addLine(to: newPoint)
        }
    }

    private func clearCurrentPath(_ value: DragGesture.Value) {
        paths.append(currentPath)
        currentPath = Path()
    }

    private var drawingToolbar: some View {
        HStack {
            ColorPicker("Pick Color", selection: $selectedColor, supportsOpacity: false)
            Slider(value: $lineWidth, in: 1...10)
            Button(action: clearAllPaths) {
                Image(systemName: "trash").foregroundColor(.black)
            }
        }
        .padding()
        .background(Color.gray.opacity(0.5))
        .cornerRadius(20)
        .padding(.horizontal)
        .padding(.bottom, 8) // Adjust padding for bottom safe area if needed
    }

    private func clearAllPaths() {
        paths.removeAll()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
