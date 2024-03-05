//
//  Carousel.swift
//  Honzapda
//
//  Created by 이재용 on 3/5/24.
//

import SwiftUI

struct Carousel<Content: View>: View {
    typealias PageIndex = Int
   // var start : CGFloat = 2
    let pageCount: Int
    let visibleEdgeSpace: CGFloat
    let spacing: CGFloat
    let content: (PageIndex) -> Content
    
    @GestureState var dragOffset: CGFloat = 0
    @State var currentIndex: Int
   
    init(
        pageCount: Int,
        visibleEdgeSpace: CGFloat,
        spacing: CGFloat,
        startingIndex : Int = 0,
        @ViewBuilder content: @escaping (PageIndex) -> Content
    ) {
        self.pageCount = pageCount
        self.visibleEdgeSpace = visibleEdgeSpace
        self.spacing = spacing
        self.content = content
        _currentIndex = State(initialValue: startingIndex)
    }
    
    var body: some View {
        GeometryReader { proxy in
            let baseOffset: CGFloat = spacing + visibleEdgeSpace
            let pageWidth: CGFloat = proxy.size.width - (visibleEdgeSpace + spacing) * 2
            let offsetX: CGFloat = baseOffset + CGFloat(currentIndex) * -pageWidth + CGFloat(currentIndex) * -spacing + dragOffset
            
            HStack(spacing: spacing) {
                ForEach(0..<pageCount, id: \.self) { pageIndex in
                    self.content(pageIndex)
                        .frame(
                            width: pageWidth,
                            height: proxy.size.height
                        )
                }
                .contentShape(Rectangle())
            }
            .offset(x: offsetX)
            .gesture(
                DragGesture()
                    .updating($dragOffset) { value, out, _ in
                        out = value.translation.width
                    }
                    .onEnded { value in
                        let offsetX = value.translation.width
                        let progress = -offsetX / pageWidth
                        let increment = Int(progress.rounded())
                        currentIndex = max(min(currentIndex + increment, pageCount - 1), 0)
                    }
            )
        }
    }
}
//struct Carousel_Previews: PreviewProvider {
//    static var previews: some View {
//        Carousel(pageCount: 5, visibleEdgeSpace: 30, spacing: 10) { index in
//            Text("Page \(index)")
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
//                .background(Color.red)
//                .cornerRadius(5)
//        }
//        .frame(height: 300)
//    }
//}
