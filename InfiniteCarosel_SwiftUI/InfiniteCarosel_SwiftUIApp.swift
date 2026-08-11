//
        //
    //  Project: InfiniteCarosel_SwiftUI
    //  File: InfiniteCarosel_SwiftUIApp.swift
    //  Created by Noah Carpenter 
    //
    //  📺 YouTube: Noah Does Coding
    //  https://www.youtube.com/@NoahDoesCoding
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Dream Big. Code Bigger 🚀
    //

    

import SwiftUI

// MARK: - App Entry Point
// @main marks this as the app's entry point.
// This struct defines the app's window and initial view hierarchy.
@main
struct InfiniteCarosel_SwiftUIApp: App {
    var body: some Scene {
        // WindowGroup creates one or more windows for the app
        // Each window displays a ContentView (the carousel UI)
        WindowGroup {
            ContentView()
        }
    }
}
