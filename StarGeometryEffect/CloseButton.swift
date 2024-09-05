//
//  CloseButton.swift
//  StarGeometryEffect
//
//  Created by Michael Haviv on 9/5/24.
//

import SwiftUI

/// A reusable view for the close button in the expanded state.
/// This button toggles the `isExpanded` state and triggers the rotation animation.
struct CloseButtonView: View {
    @Binding var isExpanded: Bool
    @Binding var rotationDegree: Double

    var body: some View {
        Button(action: {
            // Animate back to compact state
            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                isExpanded.toggle()
            }
            // Animate the star's rotation in the floating button
            withAnimation(Animation.easeInOut(duration: 3).delay(0.8)) {
                rotationDegree += 180
            }
        }) {
            Image(systemName: "xmark.circle.fill")
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(.white)
                .background(
                    Circle()
                        .fill(Color.indigo)
                        .frame(width: 60, height: 60)
                        .shadow(radius: 10)
                )
        }
        .padding(.bottom, 40)
    }
}

#Preview {
    CloseButtonView(isExpanded: .constant(true), rotationDegree: .constant(0))
}

