//
//  OnboardingView.swift
//  Honzapda
//
//  Created by YOUJIM on 2/29/24.
//

import AuthenticationServices
import SwiftUI

struct OnboardingView: View {
    @ObservedObject var onboardingViewModel = OnboardingViewModel()
    
    var body: some View {
        ZStack {
            Image("background_onboarding")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    ForEach(0...3, id: \.self) { index in
                        if index == onboardingViewModel.selectedTab {
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
                .padding(.top, 120)
                
                Spacer(minLength: 40)
                
                TabView(selection: $onboardingViewModel.selectedTab) {
                    ForEach(Common.carouselList.indices, id: \.self) { index in
                        OnboardingCarouselView(selectedTab: index)
                            .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                Spacer(minLength: 70)
                
                Button("유저로 로그인하기") {
                    // TODO: 눌렀을 때 실행될 ViewModel 제작
                }
                .tint(.white)
                .font(.sCoreDream(.bold, size: 16))
                .frame(width: 361, height: 45)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(.primary05))
                
                AppleLoginButtonView()
                    .frame(width: 361, height: 45)
                
                Spacer(minLength: 24)
                
                Button(action: {
                    // TODO: 눌렀을 때 실행될 ViewModel 제작
                }, label: {
                    HighlightedText(
                        highlightedSubstrings: [("비즈니스 계정으로 로그인하기", .primary06)],
                        highlightedFont: .sCoreDream(.medium, size: 12),
                        originalText: "사장님으로 시작하신다면? 비즈니스 계정으로 로그인하기",
                        originalColor: .gray06,
                        originalFont: .sCoreDream(.light, size: 12))
                })
                
                Spacer(minLength: 96)
            }
        }
    }
}

#Preview {
    OnboardingView()
}
