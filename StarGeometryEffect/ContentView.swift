//
//  ContentView.swift
//  StarGeometryEffect
//
//  Created by Michael Haviv on 9/4/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isExpanded = false
    @State private var rotationDegree: Double = 0
    @Namespace private var animation

    var body: some View {
        ZStack {
            if isExpanded {
                Color.black
                    .opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                    .transition(.opacity)
            }

            if isExpanded {
                VStack {
                    Spacer()
                    StarCardView(isExpanded: $isExpanded, rotationDegree: $rotationDegree)
                    Spacer()

                    // Close Button
                    Button(action: {
                        withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                            isExpanded.toggle()
                        }
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
            } else {
                StarFloatingButton(isExpanded: $isExpanded, rotationDegree: $rotationDegree, animation: animation)
            }
        }
    }
}

#Preview {
    ContentView()
}
