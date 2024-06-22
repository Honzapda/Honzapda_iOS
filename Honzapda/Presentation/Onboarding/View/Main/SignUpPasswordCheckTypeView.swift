//
//  SignUpEmailTypeView.swift
//  Honzapda
//
//  Created by 송영훈 on 6/2/24.
//

import SwiftUI

// MARK: - 회원가입 비밀번호 확인 입력 View
struct SignUpPasswordCheckTypeView: View {
    // MARK: PARAMS
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var signUpViewModel: SignUpViewModel
    @State private var inputText = ""
    private let placeholder = "비밀번호 확인"
    @State private var isNextButtonClicked = false
    
    // MARK: BODY
    var body: some View {
        VStack {
            VStack {
                HStack {
                    SignUpTitle(firstHightlightText: "로그인시 사용", firstNormalText: "할\n",
                                secondHightlightText: "비밀번호", secondNormalText: "를\n",
                                thirdHightlightText: "한 번 더 입력", thirdNormalText: "해주세요!")
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
            
            HStack{
                Text(IsPasswordSame(pw: inputText))
                    .font(.sCoreDream(.medium, size: 12))
                    .foregroundColor(.primary06)
                    .padding(.top, 16)
                    .padding(.horizontal, 24)
                Spacer()
            }
            
            Spacer()
            
            Group {
                if IsPasswordSame(pw: inputText) == "비밀번호가 일치해요! :)" {
                    Primary05Button(text: "HONZAPDA 가입하기") {
                        isNextButtonClicked = true
                    }
                } else {
                    Gray04Button(text: "다음으로") {
                        // No Action
                    }
                    .disabled(true)
                }
            }
            .padding(.bottom, 80)
            
            NavigationLink(
                destination: SignUpCompleteView(),
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
        .navigationBarItems(leading: CustomNavigationBackButton(color: .black,
                                                                title: "",
                                                                dismiss: self.dismiss))
    } //: BODY
    
    // MARK: - FUNCTION
    private func IsPasswordSame(pw retypePassword: String) -> String {
        if retypePassword.isEmpty {
            return ""
        } else {
            let isPasswordSame = (signUpViewModel.signUpModel.password == retypePassword)
            
            if isPasswordSame {
                return "비밀번호가 일치해요! :)"
            } else {
                return "비밀번호가 일치하지 않아요 :("
            }
        }
    }
    
} //: 회원가입 비밀번호 확인 입력 View
