//
//  GoldStar.swift
//  StarGeometryEffect
//
//  Created by Michael Haviv on 9/4/24.
//

import SwiftUI

/// A custom star-shaped `Shape` that is inspired by the iconic Super Mario star.
/// This shape is defined programmatically by specifying key points that form the star outline.
struct GoldStar: Shape {
    func path(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height

        // Define the key points of the star based on the width and height of the rectangle
        let points = [
            CGPoint(x: 0.5 * width, y: 0.05 * height), // Top point
            CGPoint(x: 0.65 * width, y: 0.35 * height), // Right upward dent
            CGPoint(x: width, y: 0.4 * height),        // Right outer point
            CGPoint(x: 0.75 * width, y: 0.65 * height), // Right inward dent
            CGPoint(x: 0.8 * width, y: height),         // Bottom-right outer point
            CGPoint(x: 0.5 * width, y: 0.8 * height),   // Bottom center dent
            CGPoint(x: 0.2 * width, y: height),         // Bottom-left outer point
            CGPoint(x: 0.25 * width, y: 0.65 * height), // Left inward dent
            CGPoint(x: 0, y: 0.4 * height),             // Left outer point
            CGPoint(x: 0.35 * width, y: 0.35 * height)  // Left upward dent
        ]

        // Create a path that draws lines between the defined points and dents
        var path = Path()
        path.move(to: points[0])

        for point in points.dropFirst() {
            path.addLine(to: point)
        }
        path.closeSubpath()

        return path
    }
}

#Preview {
    GoldStar()
        .fill(LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.orange]), startPoint: .top, endPoint: .bottom))
        .frame(width: 200, height: 200)
}

