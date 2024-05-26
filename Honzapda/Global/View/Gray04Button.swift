//
//  GrayButton.swift
//  Honzapda
//
//  Created by 송영훈 on 5/7/24.
//

import SwiftUI

// MARK: - GRAY04 색상 BUTTON
struct Gray04Button: View {
    var text: String
    var hEdgeSize: CGFloat = 0
    var clicked: (() -> Void)   // Action
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text(text)
                    .foregroundColor(.white)
                    .font(.sCoreDream(.bold, size: 16))
                    .padding(.vertical, 14)
                Spacer()
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(.gray04)
        )
        .frame(maxWidth: .infinity, minHeight: 8)
        .padding(.horizontal, hEdgeSize)
        .onTapGesture {
            clicked()
        }
    }
} //: GRAY04 색상 BUTTON
