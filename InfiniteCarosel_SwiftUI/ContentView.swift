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

struct ContentView: View {
    var body: some View {
       
        
        NavigationStack {
            VStack(alignment: .leading, spacing: 18){
                Text("Featured")
                    .font(.largeTitle)
                    .padding()
                
                LoopingCarousel(slides: Slide.featured)
                
                Spacer()
            }
            .padding(.top, 8)
        }
        
    }
}

#Preview {
    ContentView()
}
