//
//  StarView.swift
//  StarGeometryEffect
//
//  Created by Michael Haviv on 9/4/24.
//

import SwiftUI

/// A reusable view that shows the animated star.
/// The view uses `MatchedGeometryEffect` for smooth transitions and includes a 3D rotation for the star.
struct StarCardView: View {
    @Namespace var animation
    @Binding var isExpanded: Bool
    @Binding var rotationDegree: Double

    var body: some View {
        ZStack {
            // Card
            RoundedRectangle(cornerRadius: 25)
                .fill(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.indigo]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .matchedGeometryEffect(id: "background", in: animation)
                .frame(width: 300, height: 300)
                .shadow(radius: 20)

            // Star shape
            GoldStar()
                .fill(LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.orange]), startPoint: .top, endPoint: .bottom))
                .frame(width: 150, height: 150)
                .rotation3DEffect(Angle(degrees: rotationDegree), axis: (x: 0, y: 1, z: 0)) // 3D rotation animation
                .shadow(color: Color.yellow.opacity(0.8), radius: 10, x: 0, y: 0)
                .onAppear {
                    withAnimation(Animation.easeInOut(duration: 3).delay(0.8)) {
                        rotationDegree += 180
                    }
                }
        }
    }
}

#Preview {
    StarCardView(isExpanded: .constant(true), rotationDegree: .constant(0))
}
