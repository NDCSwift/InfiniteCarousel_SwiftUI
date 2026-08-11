# 🎠 Infinite Carousel SwiftUI

A seamless, reusable infinite carousel component built with SwiftUI that loops smoothly through a collection of slides.

---

## 🤔 What this is

This project demonstrates how to build an infinite carousel in SwiftUI that automatically loops through content without visible breaks or resets. Perfect for showcasing image galleries, testimonials, or any horizontally scrolling content that needs to feel continuous and natural.

## ✅ Why you'd use it

- **Smooth infinite scrolling** — Create carousels that loop seamlessly without jarring jumps or resets
- **Reusable components** — Modular `LoopingCarousel`, `SlideCard`, and `PageDots` components you can drop into any project
- **Accessibility-aware** — Respects system motion preferences and provides intuitive navigation

## 📺 Watch on YouTube

[![Watch on YouTube](https://img.shields.io/badge/YouTube-Watch%20the%20Tutorial-red?style=for-the-badge&logo=youtube)](https://youtu.be/0PsTCt-IK0U)

> This project was built for the [NoahDoesCoding YouTube channel](https://www.youtube.com/@NoahDoesCoding).

---

## 🚀 Getting Started

### 1. Clone the Repository
```bash
git clone https://github.com/yourusername/InfiniteCarosel_SwiftUI.git
cd InfiniteCarosel_SwiftUI
```

### 2. Open in Xcode
```bash
open InfiniteCarosel_SwiftUI.xcodeproj
```

### 3. Configure Team
- Select the project in Xcode
- Go to **Signing & Capabilities**
- Choose your team for code signing

### 4. Update Bundle ID
- Under **General**, update the Bundle Identifier to match your development team

### 5. Build and Run
- Select a simulator or physical device
- Press Cmd+R to build and run

---

## 🛠️ Notes

The carousel uses a tripled content approach to create the infinite loop effect:
- Content is repeated 3x internally to allow smooth wrapping
- The modulo operator handles index cycling seamlessly
- Scroll position is tracked to maintain UI state

## 📦 Requirements

- iOS 16+
- Xcode 14+
- SwiftUI

---

📺 [Watch the guide on YouTube](https://youtu.be/0PsTCt-IK0U)
