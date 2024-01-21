//
//  DrawingViewModel.swift
//  draw
//
//  Created by David Sloane on 20/01/2024.
//

import SwiftUI

class DrawingViewModel: ObservableObject {
    @Published var selectedColor: Color = .black
    @Published var lineWidth: CGFloat = 2
    @Published var paths: [DrawingPath] = []
    @Published var currentPath: Path?

    let lineWidthOptions: [CGFloat] = [2, 5, 8, 12] // Small, medium, large, extra large

    func updatePath(_ newPoint: CGPoint) {
        if currentPath == nil {
            currentPath = Path()
            currentPath?.move(to: newPoint)
        } else {
            currentPath?.addLine(to: newPoint)
        }
    }

    func clearCurrentPath() {
        if let currentPath = currentPath {
            let newDrawingPath = DrawingPath(path: currentPath, color: selectedColor, lineWidth: lineWidth)
            paths.append(newDrawingPath)
            self.currentPath = nil
        }
    }

    func clearAllPaths() {
        paths.removeAll()
    }
}

struct DrawingPath: Identifiable {
    let id = UUID()
    var path: Path
    var color: Color
    var lineWidth: CGFloat
}
