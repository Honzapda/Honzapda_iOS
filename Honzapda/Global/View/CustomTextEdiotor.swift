//
//  CustomTextEdiotor.swift
//  Honzapda
//
//  Created by 송영훈 on 5/8/24.
//

import SwiftUI

struct CustomTextEdiotor: View {
    @State var inputText: String = ""
    var placeHolder: String = ""
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            TextEditor(text: $inputText)
                .textEditorBackground(.gray02)
                .font(.sCoreDream(.medium, size: 12))
                .foregroundColor(.gray09)
            
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

#Preview {
    CustomTextEdiotor()
}
