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

struct SlideCard: View {
    let slide: Slide
    var body: some View {
        
        ZStack(alignment: .bottomLeading) {
            AsyncImage(url: slide.imageURL) {
                image in
                image.resizable().scaledToFill()
            } placeholder: {
                Rectangle().fill(.gray)
            }
            
            LinearGradient(colors: [.clear, .black.opacity(0.7)], startPoint: .center, endPoint: .bottom)
            
            VStack(alignment: .leading, spacing: 4){
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
        .clipShape(.rect(cornerRadius: 28))
        
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(slide.title), \(slide.location)")
    }
}

#Preview {
    SlideCard(slide: Slide.featured[0])
}
