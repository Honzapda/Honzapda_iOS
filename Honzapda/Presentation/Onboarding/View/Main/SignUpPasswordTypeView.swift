//
//  SignUpPasswordTypeView.swift
//  Honzapda
//
//  Created by 송영훈 on 6/2/24.
//

import SwiftUI

// MARK: - 회원가입 비밀번호 입력 View
struct SignUpPasswordTypeView: View {
    // MARK: PARAMS
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var signUpViewModel: SignUpViewModel
    @State private var inputText = ""
    private let placeholder = "비밀번호 입력"
    @State private var isNextButtonClicked = false
    @State private var isVisibilityButtonClicked = false
    
    // MARK: BODY
    var body: some View {
        VStack {
            VStack {
                HStack {
                    SignUpTitle(firstHightlightText: "로그인시 사용", firstNormalText: "할\n",
                                secondHightlightText: "비밀번호", secondNormalText: "를\n",
                                thirdHightlightText: "입력", thirdNormalText: "해주세요!")
                    Spacer()
                }
                HStack {
                    (Text("비밀번호는 ")
                        .font(.sCoreDream(.medium, size: 14))
                     + Text("영어 대소문자, 숫자, 특수기호를 모두 사용")
                        .font(.sCoreDream(.bold, size: 14))
                     + Text("해\n")
                        .font(.sCoreDream(.medium, size: 14))
                     + Text("8자 이상")
                        .font(.sCoreDream(.bold, size: 14))
                     + Text("으로 구성되어야 해요.")
                        .font(.sCoreDream(.medium, size: 14))
                    )
                    .foregroundStyle(.primary06)
                    .padding(.top, 16)
                    Spacer()
                }
            }
            .padding(.top, 48)
            .padding(.horizontal, 8)
            
            
            Spacer()
            
            Gray02Box {
                HStack {
                    Group {
                        if isVisibilityButtonClicked {
                            TextField(text: $inputText) {
                                Text(placeholder)
                                    .font(.sCoreDream(.medium, size: 14))
                                    .foregroundStyle(.gray05)
                            }
                        } else {
                            SecureField(text: $inputText) {
                                Text(placeholder)
                                    .font(.sCoreDream(.medium, size: 14))
                                    .foregroundStyle(.gray05)
                            }
                        }
                    }
                    .font(.sCoreDream(.medium, size: 14))
                    .foregroundStyle(.primary06)
                    .padding(.vertical, 18)
                    .padding(.horizontal, 24)
                    
                    Spacer()
                    
                    Image("icon_password_visiblity")
                        .padding(.all, 24)
                        .onTapGesture {
                            isVisibilityButtonClicked.toggle()
                        }
                }
            }
            .padding(.horizontal, 8)
            
            HStack{
                Text(PasswordValidation(pw: inputText))
                    .font(.sCoreDream(.medium, size: 12))
                    .foregroundColor(.primary06)
                    .padding(.top, 16)
                    .padding(.horizontal, 24)
                Spacer()
            }
            
            Spacer()
            
            Group {
                if PasswordValidation(pw: inputText) == "사용 가능한 비밀번호예요! :)" {
                    Primary05Button(text: "다음으로") {
                        signUpViewModel.signUpModel.password = inputText
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
                destination: SignUpPasswordCheckTypeView(signUpViewModel: self.signUpViewModel),
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
    // 비밀번호 형식 체크
    private func PasswordValidation(pw password: String) -> String {
        if password.isEmpty {
            return ""
        } else {
            let passwordRegEx = "^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$%^&*()_+=-]).{8,}"
            let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)   // 정규식 전환
            let isValidPasswordForm = passwordPredicate.evaluate(with: password)    // 비밀번호 형식 체크
            
            if isValidPasswordForm {
                return "사용 가능한 비밀번호예요! :)"
            } else {
                return "비밀번호 형식이 올바르지 않아요 :("
            }
        }
    } //: 비밀번호 형식 체크
} //: 회원가입 비밀번호 입력 View
