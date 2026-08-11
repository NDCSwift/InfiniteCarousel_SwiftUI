//
        //
    //  Project: InfiniteCarosel_SwiftUI
    //  File: ContentView.swift
    //  Created by Noah Carpenter 
    //
    //  📺 YouTube: Noah Does Coding
    //  https://www.youtube.com/@NoahDoesCoding
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Dream Big. Code Bigger 🚀
    //

    

import SwiftUI

// MARK: - Main App View
// This is the root view that displays the carousel.
// It serves as the entry point for the app's UI.
struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 18) {
                // Section header
                Text("Featured")
                    .font(.largeTitle)
                    .padding()

                // Initialize the carousel with sample slides
                // Learners can replace Slide.featured with dynamic data from an API
                LoopingCarousel(slides: Slide.featured)

                // Spacer pushes everything to the top
                Spacer()
            }
            .padding(.top, 8)
        }
    }
}

#Preview {
    ContentView()
}
