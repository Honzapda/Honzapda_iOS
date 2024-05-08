//
//  Gray02Box.swift
//  Honzapda
//
//  Created by 송영훈 on 5/8/24.
//

import SwiftUI

struct Gray02Box<Content: View>: View {
    var whSize: [CGFloat] = [0, 0]
    var horizontalPadding: CGFloat = 0
    var content: () -> Content
    
    var body: some View {
        ZStack {
            if whSize == [0, 0] {
                content()
                    .frame(maxWidth: .infinity, minHeight: 8)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(.gray02)
                    )
            }
            else {
                content()
                    .frame(width: whSize[0], height: whSize[1])
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(.gray02)
                    )
            }
        }
        .padding(.horizontal, horizontalPadding)
    }
}
