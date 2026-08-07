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

struct PageDots: View {
    let count: Int
    let current: Int
    var body: some View {
        
        HStack(spacing: 8){
            ForEach(0..<count, id: \.self){ index in
            
                Circle()
                    .fill(index == current ? Color.primary : Color.secondary.opacity(0.35))
                    .frame(width: 7, height: 7)
                
            }
        }
        .animation(.easeInOut(duration: 0.2), value: current)
        .accessibilityHidden(true)
        
    }
}

