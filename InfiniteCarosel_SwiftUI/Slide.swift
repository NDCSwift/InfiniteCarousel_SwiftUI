//
        //
    //  Project: InfiniteCarosel_SwiftUI
    //  File: Slide.swift
    //  Created by Noah Carpenter 
    //
    //  📺 YouTube: Noah Does Coding
    //  https://www.youtube.com/@NoahDoesCoding
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Dream Big. Code Bigger 🚀
    //

    

import Foundation

// MARK: - Data Model for Carousel Slides
// This struct represents a single slide in the carousel.
// Each slide contains metadata (title, location) and loads an image from an external API.
struct Slide {
    let photoID: Int
    let title: String
    let location: String

    // Computed property that constructs the image URL using picsum.photos API
    // This provides a reliable source of free images for the carousel
    var imageURL: URL? {
        URL(string: "https://picsum.photos/id/\(photoID)/900/1200")
    }
}

// MARK: - Sample Data Extension
// Provides default carousel content for testing and previewing.
// Learners can add more slides here or fetch from a real API instead.
extension Slide {
    static let featured: [Slide] = [
        Slide(photoID: 1015, title: "River Bend", location: "Cascade Range"),
        Slide(photoID: 1039, title: "Falling Water", location: "Highlands"),
        Slide(photoID: 1041, title: "Low Cloud", location: "Ridge Line"),
        Slide(photoID: 1057, title: "Long Exposure", location: "Harbour"),
        Slide(photoID: 1069, title: "Night Shift", location: "Downtown"),
    ]
}
