//
//  OnboardingCarouselView.swift
//  Honzapda
//
//  Created by YOUJIM on 3/12/24.
//

import SwiftUI

struct OnboardingCarouselView: View {
    @State var selectedTab: Int
    
    var body: some View {
        VStack {
            HighlightedText(
                highlightedSubstrings: [(Common.carouselList[selectedTab].highlightedText, .primary05)],
                highlightedFont: .sCoreDream(.bold, size: 22),
                originalText: Common.carouselList[selectedTab].originalText,
                originalColor: .gray10,
                originalFont: .sCoreDream(.medium, size: 22))
            .multilineTextAlignment(.center)
            .lineSpacing(12)
            .padding(.bottom, 16)
            
            Text(Common.carouselList[selectedTab].captionText)
                .foregroundStyle(.gray06)
                .font(.sCoreDream(.medium, size: 14))
                .multilineTextAlignment(.center)
                .lineSpacing(5)
                .padding(.bottom, 40)
            
            Image(Common.carouselList[selectedTab].imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, (50 - 16)) // 최대 이미지 사이즈 기준 - 부모 View 기본 Padding
        }
    }
}

#Preview {
    OnboardingCarouselView(selectedTab: 3)
}
