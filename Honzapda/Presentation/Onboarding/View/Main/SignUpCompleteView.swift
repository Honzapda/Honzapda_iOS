//
//  SignUpCompleteView.swift
//  Honzapda
//
//  Created by 송영훈 on 6/4/24.
//

import SwiftUI

struct SignUpCompleteView: View {
    @State private var isTimerFinish = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("HONZAPDA")
                    .font(.sCoreDream(.bold, size: 22))
                    .foregroundStyle(.primary05)
                    .padding(.bottom, 2)
                Text("가입을 축하해요!")
                    .font(.sCoreDream(.medium, size: 22))
                    .foregroundStyle(.gray10)
                    .padding(.bottom, 16)
                Text("어느 카페 가지? 자리가 있을까?\n더 이상 고민하지 마세요.")
                    .multilineTextAlignment(.center)
                    .font(.sCoreDream(.medium, size: 14))
                    .lineSpacing(6.0)
                    .foregroundStyle(.gray06)
                    .padding(.bottom, 32)
                Image(.iconSplashLogo)
                
                NavigationLink(
                    destination: SignUpCurationView(),
                    isActive: $isTimerFinish,
                    label: { EmptyView() })
            }
        }
        .background(
            Image(.backgroundSignupComplete)
                .ignoresSafeArea(.all)
                .aspectRatio(contentMode: .fit)
        )
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.isTimerFinish = true
            }
        }
    }
}

#Preview {
    SignUpCompleteView()
}
