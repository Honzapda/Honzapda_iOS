//
//  GrayButton.swift
//  Honzapda
//
//  Created by 송영훈 on 5/7/24.
//

import SwiftUI

// MARK: - GRAY03 색상 하프 BUTTON
struct Gray03HalfButton: View {
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
                        .font(.sCoreDream(.medium, size: 14))
                        .padding(.vertical, 13)
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
} //: GRAY03 색상 하프 BUTTON
