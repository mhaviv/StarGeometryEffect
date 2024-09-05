//
//  GoldStar.swift
//  StarGeometryEffect
//
//  Created by Michael Haviv on 9/4/24.
//

import SwiftUI

struct GoldStar: Shape {
    func path(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height

        let points = [
            CGPoint(x: 0.5 * width, y: 0.05 * height), // Top point
            CGPoint(x: 0.65 * width, y: 0.35 * height),
            CGPoint(x: width, y: 0.4 * height),
            CGPoint(x: 0.75 * width, y: 0.65 * height),
            CGPoint(x: 0.8 * width, y: height),
            CGPoint(x: 0.5 * width, y: 0.8 * height),
            CGPoint(x: 0.2 * width, y: height),
            CGPoint(x: 0.25 * width, y: 0.65 * height),
            CGPoint(x: 0, y: 0.4 * height),
            CGPoint(x: 0.35 * width, y: 0.35 * height)
        ]

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

