//
//  CustomTextEdiotor.swift
//  Honzapda
//
//  Created by 송영훈 on 5/8/24.
//

import SwiftUI

// MARK: - CUSTOM TEXT EDITOR
struct CustomTextEdiotor: View {    // Place holder를 제공해줌
    @Binding var inputText: String
    var placeHolder: String = ""
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            TextEditor(text: $inputText)
                .textEditorBackground(.gray02)
                .font(.sCoreDream(.medium, size: 12))
                .foregroundColor(.gray09)
            
            // 입력된 Text가 없다면 Place holder를 띄움
            if self.inputText.isEmpty {
                Text(placeHolder)
                    .lineSpacing(5)
                    .foregroundColor(.gray06)
                    .font(.sCoreDream(.medium, size: 12))
                    .padding(.top, 8)
                    .padding(.leading, 6)
            }
        }
    }
}
