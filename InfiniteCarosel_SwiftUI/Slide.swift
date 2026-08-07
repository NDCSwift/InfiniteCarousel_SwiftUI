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

struct Slide {
    let photoID: Int
    let title: String
    let location: String
    
    var imageURL: URL? {
        URL(string: "https://picsum.photos/id/\(photoID)/900/1200")
    }
    
}


extension Slide {
    static let featured: [Slide] = [
        Slide(photoID: 1015, title: "River Bend", location: "Cascade Range"),
        Slide(photoID: 1039, title: "Falling Water", location: "Highlands"),
        Slide(photoID: 1041, title: "Low Cloud", location: "Ridge Line"),
        Slide(photoID: 1057, title: "Long Exposure", location: "Harbour"),
        Slide(photoID: 1069, title: "Night Shift", location: "Downtown"),
    ]
}
