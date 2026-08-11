//
        //
    //  Project: InfiniteCarosel_SwiftUI
    //  File: SlideCard.swift
    //  Created by Noah Carpenter 
    //
    //  📺 YouTube: Noah Does Coding
    //  https://www.youtube.com/@NoahDoesCoding
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Dream Big. Code Bigger 🚀
    //

    

import SwiftUI

// MARK: - Individual Slide Card Component
// Displays a single slide with background image, gradient overlay, and text metadata.
// This is the reusable card that appears in the carousel scrollView.
struct SlideCard: View {
    let slide: Slide

    var body: some View {
        // ZStack layers views on top of each other.
        // Order: image → gradient overlay → text labels
        ZStack(alignment: .bottomLeading) {
            // AsyncImage loads the image asynchronously from the URL
            // This prevents blocking the UI while the image downloads
            AsyncImage(url: slide.imageURL) { image in
                image.resizable().scaledToFill()
            } placeholder: {
                // Shows a gray rectangle while the image is loading
                Rectangle().fill(.gray)
            }

            // LinearGradient creates a semi-transparent overlay from transparent at center
            // to dark at the bottom, making text readable over images
            LinearGradient(
                colors: [.clear, .black.opacity(0.7)],
                startPoint: .center,
                endPoint: .bottom
            )

            // Text labels positioned at the bottom left (via ZStack alignment)
            VStack(alignment: .leading, spacing: 4) {
                Text(slide.title)
                    .font(.title2)
                Text(slide.location)
                    .font(.subheadline)
            }
            .foregroundStyle(.white)
            .padding(24)
            .padding(.bottom, 55)
        }
        .frame(height: 440)
        // Apply rounded corners to create a polished look
        .clipShape(.rect(cornerRadius: 28))

        // Accessibility: Combine child elements into one readable item for VoiceOver users
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(slide.title), \(slide.location)")
    }
}

#Preview {
    SlideCard(slide: Slide.featured[0])
}
