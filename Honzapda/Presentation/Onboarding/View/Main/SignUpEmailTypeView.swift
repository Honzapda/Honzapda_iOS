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
            
            HStack {
                signUpViewModel.EmailValidation(email: inputText) ? 
                Text("사용 가능한 이메일이예요! :)")
                    .font(.sCoreDream(.medium, size: 12))
                    .foregroundColor(.primary06)
                    .padding(.top, 16)
                    .padding(.horizontal, 24)
                :
                Text("이메일 형식이 올바르지 않아요 :(")
                    .font(.sCoreDream(.medium, size: 12))
                    .foregroundColor(.primary06)
                    .padding(.top, 16)
                    .padding(.horizontal, 24)
                Spacer()
            }
            
            Spacer()
            
            Group {
                if signUpViewModel.EmailValidation(email: inputText) {
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
    

} //: 회원가입 이메일 입력 View

#Preview {
    SignUpEmailTypeView()
}
