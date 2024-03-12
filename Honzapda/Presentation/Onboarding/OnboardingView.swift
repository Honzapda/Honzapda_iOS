//
//  OnboardingView.swift
//  Honzapda
//
//  Created by YOUJIM on 2/29/24.
//

import AuthenticationServices
import SwiftUI

struct OnboardingView: View {
    var body: some View {
        ZStack {
            Image("background_onboarding")
                .resizable()
            
            VStack {
                Spacer(minLength: 120)
                
                Rectangle()
                    .frame(width: 279, height: 425)
                
                Spacer(minLength: 70)
                
                Button("유저로 로그인하기") {
                    // TODO: 눌렀을 때 실행될 ViewModel 제작
                }
                .tint(.white)
                .font(.custom("S-Core Dream", size: 14))
                .frame(width: 361, height: 45)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(.primary05)
                )
                
                AppleLoginButtonView()
                    .frame(width: 361, height: 45)
                
                Spacer(minLength: 24)
                
                Button("사장님으로 시작하신다면? 비즈니스 계정으로 로그인하기") {
                    
                }
                .font(.custom("S-Core Dream", size: 10))
                .tint(.gray06)
                
                Spacer(minLength: 96)
            }
        }
    }
}

#Preview {
    OnboardingView()
}
