//
//  ContentView.swift
//  StarGeometryEffect
//
//  Created by Michael Haviv on 9/4/24.
//

import SwiftUI

/// The main view of the app that toggles between a compact StarFloatingButton and an expanded StarCardView.
/// Uses MatchedGeometryEffect for smooth transitions between the two states.
struct ContentView: View {
    @State private var isExpanded = false
    @State private var rotationDegree: Double = 0
    @Namespace private var animation
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        ZStack {
            // Show the expanded state with the star and close button
            if isExpanded {
                // Dynamic background color for light and dark mode
                Color(colorScheme == .dark ? Color.indigo.opacity(0.2) : Color.gray.opacity(0.4))
                    .opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                    .transition(.opacity)

                VStack {
                    Spacer()
                    StarCardView(isExpanded: $isExpanded, rotationDegree: $rotationDegree)
                    Spacer()

                    // Close button to toggle back to the compact state
                    CloseButtonView(isExpanded: $isExpanded, rotationDegree: $rotationDegree)

                }
            } else {
                // Compact view with the floating button
                StarFloatingButton(isExpanded: $isExpanded, rotationDegree: $rotationDegree, animation: animation)
            }
        }
    }
}

#Preview {
    ContentView()
}
