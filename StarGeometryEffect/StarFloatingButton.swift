//
//  FloatingButton.swift
//  StarGeometryEffect
//
//  Created by Michael Haviv on 9/5/24.
//

import SwiftUI

/// A floating button used in the compact state.
/// The button toggles the expansion and triggers the star rotation animation.
struct StarFloatingButton: View {
    @Binding var isExpanded: Bool
    @Binding var rotationDegree: Double
    var animation: Namespace.ID

    var body: some View {
        ZStack {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        // Animate to expanded state
                        withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                            isExpanded.toggle()
                        }
                        // Animate the star's rotation in StarCardView.
                        withAnimation(Animation.easeInOut(duration: 3).delay(0.8)) {
                            rotationDegree += 180
                        }
                    }) {
                        ZStack {
                            // Circle background with gradient for the floating button.
                            Circle()
                                .fill(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.indigo]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                .frame(width: 70, height: 70)
                                .shadow(radius: 10)
                                .matchedGeometryEffect(id: "cardTransition", in: animation)

                            // Star icon inside the floating button.
                            GoldStar()
                                .fill(LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.orange]), startPoint: .top, endPoint: .bottom))
                                .frame(width: 50, height: 50)
                                .rotation3DEffect(Angle(degrees: rotationDegree), axis: (x: 0, y: 1, z: 0))
                                .matchedGeometryEffect(id: "icon", in: animation)
                        }
                    }
                    .padding(30)
                }
            }
        }
    }
}

#Preview {
    StarFloatingButton(isExpanded: .constant(false), rotationDegree: .constant(0), animation: Namespace().wrappedValue)
}

