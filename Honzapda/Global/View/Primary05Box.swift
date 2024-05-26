//
//  Gray02Box.swift
//  Honzapda
//
//  Created by 송영훈 on 5/8/24.
//

import SwiftUI

// MARK: - PRIMARY05 색상을 배경으로 하는 View
struct Primary05Box<Content: View>: View {
    var whSize: [CGFloat] = [0, 0]
    var horizontalPadding: CGFloat = 0
    var content: () -> Content
    
    var body: some View {
        ZStack {
            if whSize == [0, 0] {  // CASE 1: 고정된 W, H가 없는 경우
                content()
                    .frame(maxWidth: .infinity, minHeight: 8)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(.primary05)
                    )
            } else {  // CASE 2: 고정된 W, H가 있는 경우
                content()
                    .frame(width: whSize[0], height: whSize[1])
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(.primary05)
                    )
            }
        }
        .padding(.horizontal, horizontalPadding)
    }
} //: GRAY02 색상을 배경으로 하는 View
