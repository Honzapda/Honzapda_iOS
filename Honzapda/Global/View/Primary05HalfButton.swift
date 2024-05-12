//
//  PrimaryButton.swift
//  Honzapda
//
//  Created by 송영훈 on 5/7/24.
//

import SwiftUI

// MARK: - PRIMARY05 색상 하프 BUTTON
struct Primary05HalfButton: View {
    var text: String
    var hEdgeSize: CGFloat = 0
    var clicked: (() -> Void)   // Action
    
    var body: some View {
        Button(action: clicked) {
            VStack {
                HStack {
                    Spacer()
                    Text(text)
                        .tint(.white)
                        .font(.sCoreDream(.medium, size: 14))
                        .padding(.vertical, 13)
                    Spacer()
                }
            }
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(.primary05)
            )
            .frame(maxWidth: .infinity, minHeight: 8)
            .padding(.horizontal, hEdgeSize)
        }
    }
} //: PRIMARY05 색상 하프 BUTTON
