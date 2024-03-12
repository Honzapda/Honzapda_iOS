//
//  View+.swift
//  Honzapda
//
//  Created by YOUJIM on 3/12/24.
//

import SwiftUI


// MARK: 문장 중간 지정된 단어들의 색깔과 굵기를 바꿔주는 구조체 선언
// CAUTION: 처음 등장하는 단어를 체크하기 때문에 공통된 단어들일지라도 처음 등장한 단어에만 적용됨
// 모두 적용하고 싶으면 원하는 단어의 수대로 적용해줘야함

struct HighlightedText: View {
    var highlightedSubstrings: [(String, Color)]
    var highlightedFont: Font
    var originalText: String
    var originalColor: Color
    var originalFont: Font
    
    var body: some View {
        var currentIndex = originalText.startIndex
        var result: Text = Text("")
        
        for (substring, color) in highlightedSubstrings {
            if let range = originalText.range(
                of: substring,
                range: currentIndex ..< originalText.endIndex
            ) {
                let beforeRange = originalText[currentIndex ..< range.lowerBound]
                let coloredText = originalText[range]
                
                result = (result + Text(beforeRange))
                    .foregroundColor(originalColor)
                    .font(originalFont)
                result = (result + Text(coloredText))
                    .foregroundColor(color)
                    .font(highlightedFont)
                
                currentIndex = range.upperBound
            }
        }
        
        let remainingText = originalText[currentIndex...]
        result = (result + Text(remainingText))
            .foregroundColor(originalColor)
            .font(originalFont)
        
        return result
    }
}
