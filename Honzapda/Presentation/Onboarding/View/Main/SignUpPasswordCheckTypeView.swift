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
            
            Spacer()
            
            Primary05Button(text: "HONZAPDA 가입하기") {
                isNextButtonClicked = true
            }
            .padding(.bottom, 80)
        }
        .edgesIgnoringSafeArea(.bottom)
        .padding(.horizontal, 16)
        .background(
            Image("background_signup")
                .resizable()
                .scaledToFit()
        )
        .fullScreenCover(isPresented: $isNextButtonClicked) {
            SignUpCompleteView()
        }
        .transaction({ transaction in
            transaction.disablesAnimations = true
        })
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomNavigationBackButton(color: .black,
                                                                title: "",
                                                                dismiss: self.dismiss))
    } //: BODY
} //: 회원가입 비밀번호 확인 입력 View
