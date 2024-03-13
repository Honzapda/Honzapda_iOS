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
            HStack {
                ForEach(0...3, id: \.self) { index in
                    if index == selectedTab {
                        Circle()
                            .frame(width: 4, height: 4)
                            .foregroundStyle(.primary05)
                    } else {
                        Circle()
                            .stroke(.primary05, lineWidth: 0.5)
                            .frame(width: 4, height: 4)
                            .foregroundStyle(.clear)}
                }
            }
            
            Spacer(minLength: 40)
            
            HighlightedText(
                highlightedSubstrings: [(Common.carouselList[selectedTab].highlightedText, .primary05)],
                highlightedFont: .sCoreDream(.bold, size: 22),
                originalText: Common.carouselList[selectedTab].originalText,
                originalColor: .gray10,
                originalFont: .sCoreDream(.medium, size: 22))
            .multilineTextAlignment(.center)
            .lineSpacing(12)
            
            Spacer(minLength: 16)
            
            Text(Common.carouselList[selectedTab].captionText)
                .foregroundStyle(.gray06)
                .font(.sCoreDream(.medium, size: 14))
                .multilineTextAlignment(.center)
                .lineSpacing(5)
            
            Spacer(minLength: 40)
            
            Image(Common.carouselList[selectedTab].imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 279, height: 228)
        }
    }
}

#Preview {
    OnboardingView(onboardingViewModel: OnboardingViewModel())
}
