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
    private let placeholder = "honzapda@gmail.com"
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
                .keyboardType(.emailAddress)
            }
            .padding(.horizontal, 8)
            
            HStack{
                Text(EmailValidation(email: inputText))
                    .font(.sCoreDream(.medium, size: 12))
                    .foregroundColor(.primary06)
                    .padding(.top, 16)
                    .padding(.horizontal, 24)
                Spacer()
            }
            
            Spacer()
            
            Group {
                if EmailValidation(email: inputText) == "사용 가능한 이메일이예요! :)" {
                    Primary05Button(text: "다음으로") {
                        signUpViewModel.signUpModel.email = inputText
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
                destination: SignUpPasswordTypeView(signUpViewModel: self.signUpViewModel),
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
    // 이메일 형식 체크
    private func EmailValidation(email: String) -> String {
        if email.isEmpty {
            return ""
        } else {
            /// 나중에 최소지원 16으로 올리면 /정규표현식/ 방식으로 변경
            let emailRegEx = "[A-Z0-9a-z._%+_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx) // 정규식 전환
            let isValidEmailForm = emailPredicate.evaluate(with: email) // 이메일 형식 체크
            
            if isValidEmailForm {
                return "사용 가능한 이메일이예요! :)"
            } else {
                return "이메일 형식이 올바르지 않아요 :("
            }
        }
    } //: 이메일 형식 체크
} //: 회원가입 이메일 입력 View

#Preview {
    SignUpEmailTypeView()
}
