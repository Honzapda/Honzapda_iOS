//
//  InfoBoxView.swift
//  Honzapda
//
//  Created by 송영훈 on 4/1/24.
//

import SwiftUI

// MARK: - 카페 정보 박스 템플릿
struct InfoBoxView: View {
    // MARK: PARAMETER
    var width: CGFloat!
    var height: CGFloat!
    var shadow_color: Color!
    var shadow_radius: CGFloat!
    var shadow_x: CGFloat!
    var shadow_y: CGFloat!
    
    // MARK: BODY
    var body: some View {
        Rectangle()
            .foregroundColor(.white)
            .frame(width: width, height: height)
            .cornerRadius(8)
            .shadow(color: shadow_color,
                    radius: shadow_radius,
                    x: shadow_x, y: shadow_y)
    }
} //: 카페 정보 박스 템플릿
