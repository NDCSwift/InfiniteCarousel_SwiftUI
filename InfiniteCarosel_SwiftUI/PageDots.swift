//
        //
    //  Project: InfiniteCarosel_SwiftUI
    //  File: PageDots.swift
    //  Created by Noah Carpenter 
    //
    //  📺 YouTube: Noah Does Coding
    //  https://www.youtube.com/@NoahDoesCoding
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Dream Big. Code Bigger 🚀
    //

    import SwiftUI

// MARK: - Page Indicator Dots Component
// Shows a row of dots indicating the current page in the carousel.
// The active dot is highlighted, others are dimmed.
struct PageDots: View {
    let count: Int    // Total number of slides
    let current: Int  // Index of the currently visible slide

    var body: some View {
        // HStack arranges dots horizontally
        HStack(spacing: 8) {
            // Create one dot for each slide
            ForEach(0..<count, id: \.self) { index in
                Circle()
                    // Active dot uses primary color (opaque), inactive dots are secondary and faded
                    .fill(index == current ? Color.primary : Color.secondary.opacity(0.35))
                    .frame(width: 7, height: 7)
            }
        }
        // Animate the transition when the active dot changes
        // This creates a smooth visual feedback as the user scrolls
        .animation(.easeInOut(duration: 0.2), value: current)
        // Hide from VoiceOver since the dots are visual indicators only;
        // the carousel itself provides accessibility context
        .accessibilityHidden(true)
    }
}

