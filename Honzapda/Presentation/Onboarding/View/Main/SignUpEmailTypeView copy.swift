//
//  SignUpEmailTypeView.swift
//  Honzapda
//
//  Created by 송영훈 on 6/2/24.
//

import SwiftUI

// MARK: - 회원가입 이메일 입력 View
struct SignUpEmailTypeView: View {
    // MARK: PARAMS
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var signUpViewModel = SignUpViewModel()
    @State private var inputText = ""
    let placeholder = "honzapda@gmail.com"
    @State private var isNextButtonClicked = false
    
    // MARK: BODY
    var body: some View {
        VStack {
            VStack {
                HStack {
                    SignUpTitle(firstHightlightText: "로그인시 사용", firstNormalText: "할\n",
                                secondHightlightText: "이메일 주소", secondNormalText: "를\n",
                                thirdHightlightText: "입력", thirdNormalText: "해주세요!")
                    Spacer()
                }
            }
            .padding(.top, 48)
            .padding(.horizontal, 8)
            
            Spacer()
            
            Gray02Box {
                TextField(text: $inputText) {
                    Text(placeholder)
                        .font(.sCoreDream(.medium, size: 14))
                        .foregroundStyle(.gray05)
                }
                .font(.sCoreDream(.medium, size: 14))
                .foregroundStyle(.primary06)
                .padding(.vertical, 18)
                .padding(.horizontal, 24)
            }
            .padding(.horizontal, 8)
            
            Spacer()
            
            Primary05Button(text: "다음으로") {
                isNextButtonClicked = true
            }
            .padding(.bottom, 80)
            
            NavigationLink(
                destination: SignUpPasswordTypeView(),
                isActive: $isNextButtonClicked,
                label: { EmptyView() }
            )
        }
        .edgesIgnoringSafeArea(.bottom)
        .padding(.horizontal, 16)
        .background(
            Image("background_signup")
                .resizable()
                .scaledToFit()
        )
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: customNavigationBackButton(color: .black,
                                                                title: "",
                                                                dismiss: self.dismiss))
        
    } //: BODY
} //: 회원가입 이메일 입력 View

#Preview {
    SignUpEmailTypeView()
}
