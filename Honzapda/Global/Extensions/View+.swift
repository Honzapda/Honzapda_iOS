//
//  View+.swift
//  Honzapda
//
//  Created by YOUJIM on 3/12/24.
//

import SwiftUI

// MARK: - GLOBAL STRUCT

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

// MARK: - Navigation back button custom
struct customNavigationBackButton: View {
    let color: Color
    let title: String
    let dismiss: DismissAction
    
    var body: some View {
        Button {
            dismiss()
        } label: {
            HStack {
                Image(.iconChevronLeft) // '<' Image
                    .foregroundColor(color)
                
                Text(title)
                    .foregroundStyle(.black)
            }
        }
    }
}

struct SignUpTitle: View {
    let firstHightlightText: String
    let firstNormalText: String
    let secondHightlightText: String
    let secondNormalText: String
    let thirdHightlightText: String
    let thirdNormalText: String
    var body: some View {
        (Text(firstHightlightText)
            .font(.sCoreDream(.bold, size: 26))
        + Text(firstNormalText)
            .font(.sCoreDream(.medium, size: 26))
        + Text(secondHightlightText)
            .font(.sCoreDream(.bold, size: 26))
        + Text(secondNormalText)
            .font(.sCoreDream(.medium, size: 26))
        + Text(thirdHightlightText)
            .font(.sCoreDream(.bold, size: 26))
        + Text(thirdNormalText)
            .font(.sCoreDream(.medium, size: 26))
        )
        .foregroundStyle(.primary06)
        .lineSpacing(12)
    }
}

struct GrayOutlineButton: View {
    let title: String
    @State var isSelected = false
    
    var body: some View {
        if isSelected {
            Text(title)
                .font(.sCoreDream(.medium, size: 16))
                .foregroundColor(.white)
                .padding(EdgeInsets(top: 8, leading: 24, bottom: 8, trailing: 24))
                .background(.primary05)
                .overlay(
                    RoundedRectangle(cornerRadius: 24)
                        .inset(by: 0.5)
                        .stroke(.primary05, lineWidth: 1)
                    
                )
                .clipShape(RoundedRectangle(cornerRadius: 24))
                .onTapGesture {
                    isSelected = false
                }
        } else {
            Text(title)
                .font(.sCoreDream(.medium, size: 16))
                .foregroundColor(.gray06)
                .padding(EdgeInsets(top: 8, leading: 24, bottom: 8, trailing: 24))
                .overlay(
                    RoundedRectangle(cornerRadius: 24)
                        .inset(by: 0.5)
                        .stroke(.gray04, lineWidth: 1)
                )
                .onTapGesture {
                    isSelected = true
                }
        }
    }
}

// MARK: - EXTENSION
extension View {
    // MARK: - Text editor background color 설정하는 확장
    func textEditorBackground(_ content: Color) -> some View {
        if #available(iOS 16.0, *) {
            return self.scrollContentBackground(.hidden)
                .background(content)
        } else {
            UITextView.appearance().backgroundColor = .clear
            return self.background(content)
        }
    } //: Text editor background color 설정하는 확장
} //: EXTENSION

// MARK: - PRIAVTE STRUCT
