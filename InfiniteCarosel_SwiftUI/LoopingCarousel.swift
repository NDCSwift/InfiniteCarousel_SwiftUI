//
        //
    //  Project: InfiniteCarosel_SwiftUI
    //  File: LoopingCarousel.swift
    //  Created by Noah Carpenter 
    //
    //  📺 YouTube: Noah Does Coding
    //  https://www.youtube.com/@NoahDoesCoding
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Dream Big. Code Bigger 🚀
    //

    

import SwiftUI

// MARK: - Main Looping Carousel Component
// This is the core carousel that enables infinite scrolling through slides.
// Key concept: We triple the slide content to create a seamless loop.
// For example, 5 slides become [0,1,2,3,4,0,1,2,3,4,0,1,2,3,4] (15 total).
// As the user scrolls past position 5, we imperceptibly "recenter" them,
// creating the illusion of an infinite scroll.
struct LoopingCarousel: View {
    let slides: [Slide]

    // MARK: State Management
    // @State makes these values reactive—the UI updates when they change
    @State private var posistion: Int?  // Current scroll position (spelling note: this is "posistion" as in the original code)
    @State private var phase: ScrollPhase = .idle  // Tracks if user is actively scrolling or has stopped
    @Environment(\.accessibilityReduceMotion) private var reduceMotion  // Respect user's motion preferences

    // MARK: Computed Properties
    // This multiplier creates our "infinite" effect by tripling the slides
    private var loopCount: Int {
        slides.count * 3
    }

    init(slides: [Slide]) {
        self.slides = slides
        // Start at the middle section (slides.count) so there's content on both sides
        // This allows seamless wrapping in both directions
        _posistion = State(initialValue: slides.count)
    }

    var body: some View {
        VStack(spacing: 20) {
            // MARK: Horizontal Scroll Container
            ScrollView(.horizontal) {
                LazyHStack(spacing: 16) {
                    // Create all the carousel items (3x the original slides)
                    ForEach(0..<loopCount, id: \.self) { index in
                        SlideCard(slide: slides[index % slides.count])
                            // containerRelativeFrame makes each card fill the available scroll width
                            .containerRelativeFrame(.horizontal, count: 1, spacing: 16)
                    }
                }
                // Required for .scrollPosition and .scrollTargetBehavior to work properly
                .scrollTargetLayout()
            }
            .frame(height: 440)
            // .viewAligned snaps to card boundaries for smooth paging
            .scrollTargetBehavior(.viewAligned)
            // Track the current scroll position
            .scrollPosition(id: $posistion)
            // Hide the default horizontal scroll indicator for a cleaner look
            .scrollIndicators(.hidden)
            // Add padding on left/right so cards don't touch the screen edges
            .contentMargins(.horizontal, 24, for: .scrollContent)
            // Detect when scrolling starts/stops to trigger the recenter logic
            .onScrollPhaseChange { _, newPhase in
                phase = newPhase
                // When scroll ends (.idle), we recenter if needed to maintain the loop illusion
                if newPhase == .idle { recenter() }
            }

            // MARK: Page Indicator
            // Shows which slide the user is viewing (converted to 0-based index)
            PageDots(count: slides.count, current: (posistion ?? 0) % slides.count)
        }
        // Auto-advance through slides every 5 seconds (if reduce motion is not enabled)
        .task(id: reduceMotion) {
            await autoAdvance()
        }
    }

    // MARK: - Recenter Logic
    // When the user scrolls far enough, we imperceptibly jump them back to the middle section
    // This creates the seamless infinite loop without the user noticing the jump
    private func recenter() {
        guard let posistion, !slides.isEmpty else { return }

        // Map the current position to an equivalent position in the middle section
        // Example: if at position 15 (end), jump to position 5 (middle) which looks identical
        let middle = posistion % slides.count + slides.count

        // Only recenter if we've actually drifted far from the middle
        guard middle != posistion else { return }

        // Use a Transaction to disable animation during the jump
        // This makes the recenter invisible to the user
        var transaction = Transaction()
        transaction.disablesAnimations = true
        withTransaction(transaction) { self.posistion = middle }
    }

    // MARK: - Auto-Advance Logic
    // Automatically scrolls to the next slide every 5 seconds if the user isn't interacting
    @MainActor
    private func autoAdvance() async {
        // Don't auto-advance if the user has motion reduction enabled
        guard !reduceMotion else { return }

        let clock = ContinuousClock()

        while !Task.isCancelled {
            // Wait 5 seconds before advancing
            try? await clock.sleep(for: .seconds(5))
            // Only advance if the user isn't actively scrolling
            guard phase == .idle else { continue }
            // Smoothly animate to the next slide
            withAnimation(.easeInOut(duration: 0.6)) {
                posistion = (posistion ?? slides.count) + 1
            }
        }
    }
}


