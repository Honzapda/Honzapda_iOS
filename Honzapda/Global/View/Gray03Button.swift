//
//  GrayButton.swift
//  Honzapda
//
//  Created by 송영훈 on 5/7/24.
//

import SwiftUI

// MARK: - GRAY03 색상 BUTTON
struct Gray03Button: View {
    var text: String
    var hEdgeSize: CGFloat = 0
    var clicked: (() -> Void)   // Action
    
    var body: some View {
        Button(action: clicked) {
            VStack {
                HStack {
                    Spacer()
                    Text(text)
                        .tint(.gray07)
                        .font(.sCoreDream(.bold, size: 16))
                        .padding(.vertical, 14)
                    Spacer()
                }
            }
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(.gray03)
            )
            .frame(maxWidth: .infinity, minHeight: 8)
            .padding(.horizontal, hEdgeSize)
        }
    }
} //: GRAY03 색상 버튼
