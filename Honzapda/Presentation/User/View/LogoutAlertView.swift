//
//  LogoutAlertView.swift
//  Honzapda
//
//  Created by 황주연 on 3/12/24.
//

import SwiftUI

// MARK: - 로그아웃 팝업 뷰
struct LogoutAlertView: View {
    @Environment(\.dismiss) var dismiss
    // MARK: BODY
    var body: some View {
        NavigationView {
            ZStack {
                Color.clear
                VStack {
                    Image(.imageMyBored)
                        .frame(width: 112, height: 112)
                        .padding(.bottom, 25)
                        .padding(.top, 40)
                    
                    Text("현재 계정에서\n로그아웃하시겠어요?")
                        .multilineTextAlignment(.center)
                        .font(.sCoreDream(.bold, size: 20))
                        .foregroundStyle(.primary06)
                        .padding(.bottom, 18)
                    
                    HStack(spacing: 12) { // 버튼
                        NavigationLink( // 로그아웃
                            destination: OnboardingView().navigationBarBackButtonHidden()
                            // TODO: 로그아웃 로직 구현
                        ) {
                            Text("로그아웃")
                                .font(.sCoreDream(.medium, size: 14))
                                .foregroundColor(.gray07)
                                .padding(EdgeInsets(top: 13,
                                                    leading: 34,
                                                    bottom: 13,
                                                    trailing: 34)
                                )
                                .background(RoundedRectangle(cornerRadius: 12)
                                    .fill(.gray03)
                                    .frame(width: 130, height: 44)
                                )
                        } //: 로그아웃
                        
                        Button { // 로그인 유지
                            print("로그인 유지")
                            dismiss()
                        } label: {
                            // TODO: 로그인 유지 로직 구현
                            Text("로그인 유지")
                                .font(.sCoreDream(.medium, size: 14))
                                .foregroundColor(.white)
                                .padding(EdgeInsets(top: 13,
                                                    leading: 34,
                                                    bottom: 13,
                                                    trailing: 34)
                                )
                                .background(RoundedRectangle(cornerRadius: 12)
                                    .fill(.primary05)
                                    .frame(width: 130, height: 44)
                                )
                        } //: 로그인 유지
                    } //: 버튼
                    .padding(.bottom, 16)
                }
                .background(RoundedRectangle(cornerRadius: 16)
                    .fill(.white)
                    .frame(width: 320, height: 320)
                    .shadow(radius: 1)
                )
            }
        }
    }
}

#Preview {
    LogoutAlertView()
}

