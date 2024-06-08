//
//  View+.swift
//  Honzapda
//
//  Created by YOUJIM on 3/12/24.
//

import SwiftUI

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
  
  // MARK: - 텍스트필드 플레이스 홀더에 폰트를 적용할 수 있게 하는 익스텐션
  func placeholder<Content: View> (
       when shouldShow: Bool, // 플레이스 홀더가 사라질 조건
       alignment: Alignment = .leading,
       @ViewBuilder placeholder: () -> Content) -> some View {
       ZStack(alignment: alignment) {
           placeholder().opacity(shouldShow ? 1 : 0)
           self
       } // 투명도 컨트롤로 조절
   }
} //: EXTENSION
