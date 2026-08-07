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

struct LoopingCarousel: View {
    let slides: [Slide]
    
    @State private var posistion: Int?
    @State private var phase: ScrollPhase = .idle
    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    
    
    private var loopCount: Int {
        slides.count * 3
    }
    
    init(slides: [Slide]){
        self.slides = slides
        _posistion = State(initialValue: slides.count)
    }
    var body: some View {
       
        VStack(spacing: 20){
            ScrollView(.horizontal) {
                LazyHStack(spacing: 16){
                    ForEach(0..<loopCount, id: \.self) { index in
                        
                        SlideCard(slide: slides[index % slides.count])
                            .containerRelativeFrame(.horizontal, count: 1, spacing: 16)
                        
                    }
                }
                .scrollTargetLayout()
            }
            .frame(height: 440)
            .scrollTargetBehavior(.viewAligned)
            .scrollPosition(id: $posistion)
            .scrollIndicators(.hidden)
            .contentMargins(.horizontal, 24, for: .scrollContent)
            .onScrollPhaseChange { _, newPhase in
                phase = newPhase
                if newPhase == .idle { recenter() }
                
            }
            
            PageDots(count: slides.count, current: (posistion ?? 0) % slides.count)
        }
        .task(id: reduceMotion) {
            await autoAdvance()
        }
    }
    
    private func recenter() {
        guard let posistion, !slides.isEmpty else { return }
        let middle = posistion % slides.count + slides.count
        guard middle != posistion else { return }
        
        var transaction = Transaction()
        transaction.disablesAnimations = true
        withTransaction(transaction) { self.posistion = middle }
        
    }
    
    @MainActor
    private func autoAdvance() async {
        guard !reduceMotion else { return }
        
        let clock = ContinuousClock()
        
        while !Task.isCancelled {
            try? await clock.sleep(for: .seconds(5))
            guard phase == .idle else { continue }
            withAnimation(.easeInOut(duration: 0.6)){
                posistion = (posistion ?? slides.count) + 1
            }
        }
    }
}


