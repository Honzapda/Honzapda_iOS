//
//  OnboardingView.swift
//  Honzapda
//
//  Created by YOUJIM on 2/29/24.
//  Co-op with 0Hooni on 5/28/24.
//

import AuthenticationServices
import SwiftUI

struct OnboardingView: View {
    @ObservedObject var onboardingViewModel = OnboardingViewModel()
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            VStack {
                // Index mark
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
                                .foregroundStyle(.clear)
                        }
                    }
                } //: Index mark
                .padding(.bottom, 40)
                
                // 스크롤 이미지
                TabView(selection: $onboardingViewModel.selectedTab) {
                    ForEach(Common.carouselList.indices, id: \.self) { index in
                        OnboardingCarouselView(selectedTab: index)
                            .tag(index)
                    }
                } //: 스크롤 이미지
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                VStack(spacing: 12) {
                    NavigationLink(
                        destination: LoginView(),
                        isActive: $onboardingViewModel.isLoginButtonTapped,
                        label: {
                            Primary05Button(text: "유저로 로그인하기") {
                                onboardingViewModel.isLoginButtonTapped.toggle()
                            }
                        })
                    AppleLoginButtonView()
                }
                .padding(.bottom, 24)
                
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
                
                Spacer()
            }
            .padding(.horizontal, 16)
            .padding(.top, 120)
            .padding(.bottom, 96)
            // 배경 처리
            .background(
                Image("background_onboarding")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
            ) //: 배경 처리
            .ignoresSafeArea(.all)
        }
    } //: BODY
}

#Preview {
    OnboardingView()
}
