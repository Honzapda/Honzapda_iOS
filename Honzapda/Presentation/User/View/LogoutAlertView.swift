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
        ZStack {
            VStack {
                Image("image_my_bored")
                    .frame(width: 112, height: 112)
                    .padding(.bottom, 25)
                    .padding(.top, 40)
                
                Text("현재 계정에서\n로그아웃하시겠어요?")
                    .multilineTextAlignment(.center)
                    .font(.custom("S-CoreDream-6Bold", size: 20))
                    .foregroundStyle(Color.primary06)
                    .padding(.bottom, 18)
                
                HStack(spacing: 12) { // 버튼
                    Button { // 로그아웃
                        print("로그아웃")
                        dismiss()
                    } label: {
                        // TODO: 로그아웃 로직 구현
                        Text("로그아웃")
                            .font(.custom("S-CoreDream-5Medium", size: 14))
                            .foregroundColor(Color.gray07)
                            .padding(EdgeInsets(top: 13,
                                                leading: 34,
                                                bottom: 13,
                                                trailing: 34)
                            )
                            .background(RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.gray03)
                                    .frame(width: 130, height: 44)
                            )
                    } //: 로그아웃
                    
                    Button { // 로그인 유지
                        print("로그인 유지")
                        dismiss()
                    } label: {
                        // TODO: 로그인 유지 로직 구현
                            Text("로그인 유지")
                                .font(.custom("S-CoreDream-5Medium", size: 14))
                                .foregroundColor(Color.white)
                                .padding(EdgeInsets(top: 13,
                                                    leading: 34,
                                                    bottom: 13,
                                                    trailing: 34)
                                )
                                .background(RoundedRectangle(cornerRadius: 12)
                                        .fill(Color.primary05)
                                        .frame(width: 130, height: 44)
                                )
                        } //: 로그인 유지
                } //: 버튼
                .padding(.bottom, 16)
            }
            .background(RoundedRectangle(cornerRadius: 16)
                    .fill(Color.white)
                    .frame(width: 320, height: 320)
                    .shadow(radius: 1)
            )
        }
        .frame(width: 320, height: 320)
    }
}

#Preview {
    LogoutAlertView()
}
