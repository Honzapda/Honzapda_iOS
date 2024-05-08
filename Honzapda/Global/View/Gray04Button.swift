//
//  GrayButton.swift
//  Honzapda
//
//  Created by 송영훈 on 5/7/24.
//

import SwiftUI

struct Gray04Button: View {
    var text: String
    var hEdgeSize: CGFloat = 0
    var clicked: (() -> Void)
    
    var body: some View {
        Button(action: clicked) {
            VStack {
                HStack {
                    Spacer()
                    Text(text)
                        .tint(.white)
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
        }
    }
}
