//
//  FloatingButton.swift
//  StarGeometryEffect
//
//  Created by Michael Haviv on 9/5/24.
//

import SwiftUI

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
                        withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                            isExpanded.toggle()
                        }
                        withAnimation(Animation.easeInOut(duration: 3).delay(0.8)) {
                            rotationDegree += 180
                        }
                    }) {
                        ZStack {
                            Circle()
                                .fill(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.indigo]), startPoint: .topLeading, endPoint: .bottomTrailing))
                                .frame(width: 70, height: 70)
                                .shadow(radius: 10)
                                .matchedGeometryEffect(id: "background", in: animation)

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

