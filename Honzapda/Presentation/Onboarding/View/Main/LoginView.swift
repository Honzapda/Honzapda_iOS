//
//  LoginView.swift
//  Honzapda
//
//  Created by YOUJIM on 5/8/24.
//  Co-op with 0Hooni on 5/28/24.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var loginViewModel = LoginViewModel()
    @State var isLoginFailed: Bool = false
    
    var body: some View { // 로그인 메인
        VStack {
            Spacer()
            VStack {
                HStack {
                    Text("로그인")
                        .font(.sCoreDream(.bold, size: 26))
                        .foregroundStyle(.primary06)
                        .padding(.top, 48)
                    
                    Spacer()
                }
                .padding(.bottom, 8)
                
                HStack {
                    Text("서비스 이용을 위해 HONZAPDA 계정으로 로그인하세요!")
                        .font(.sCoreDream(.medium, size: 12))
                        .foregroundStyle(.gray06)
                    Spacer()
                }
                .padding(.bottom, 33)
                
                HStack {
                    Text("이메일")
                        .font(.sCoreDream(.bold, size: 14))
                        .foregroundStyle(.gray08)
                    
                    Spacer()
                }
                .padding(.bottom, 16)
                
                HStack {
                    TextField("아이디 입력", text: $loginViewModel.id)
                        .padding(.leading, 24)
                        .font(.sCoreDream(.medium, size: 12))
                        .tint(.gray06)
                        .padding(.vertical, 15)
                        .background {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.gray02)
                        }
                    Spacer()
                }
                .padding(.bottom, 24)
                
                HStack {
                    Text("비밀번호")
                        .font(.sCoreDream(.bold, size: 14))
                        .foregroundStyle(.gray08)
                    
                    Spacer()
                }
                .padding(.bottom, 16)
                
                HStack {
                    SecureField("비밀번호 입력", text: $loginViewModel.password)
                        .padding(.leading, 24)
                        .font(.sCoreDream(.medium, size: 12))
                        .tint(.gray06)
                        .padding(.vertical, 15)
                        .background {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.gray02)
                        }
                    
                    Spacer()
                }
                .padding(.bottom, 16)
                
                HStack {
                    // 자동 로그인 버튼
                    Button(action: {
                        loginViewModel.isAutoLoginEnabled.toggle()
                    }, label: {
                        HStack {
                            if loginViewModel.isAutoLoginEnabled {
                                Image(.iconOnboardingAutoLoginFill)
                                    .resizable()
                                    .frame(width: 12, height: 12)
                                    .aspectRatio(contentMode: .fill)
                            } else {
                                Image(.iconOnboardingAutoLoginNone)
                                    .resizable()
                                    .frame(width: 12, height: 12)
                                    .aspectRatio(contentMode: .fill)
                            }
                            
                            Text("자동 로그인")
                                .font(.sCoreDream(.medium, size: 10))
                                .foregroundStyle(.gray08)
                                .padding(.leading, 8)
                        }
                    }) //: 자동 로그인 버튼
                    
                    Spacer()
                    
                    Button("아이디 찾기") {
                        // TODO: 아이디 찾기 화면으로 연결
                    }
                    .font(.sCoreDream(.medium, size: 10))
                    .tint(.gray07)
                    .padding(.trailing, 8)
                    
                    Button("비밀번호 찾기") {
                        // TODO: 비밀번호 찾기 화면으로 연결
                    }
                    .font(.sCoreDream(.medium, size: 10))
                    .tint(.gray07)
                    
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 48)
                
                // 조건별 로그인 버튼
                if loginViewModel.id.isEmpty || loginViewModel.password.isEmpty {
                    Gray04Button(text: "로그인") { // CASE 1: 비활성화
                        // TODO: 로그인 화면 전환
                        
                    }
                } else {
                    Primary05Button(text: "로그인") { // CASE 2: 활성화
                        // TODO: 로그인 체크 - 메인 스레드에서 이루어져야 한다
                        loginViewModel.apiAuthLogin(email: loginViewModel.id, passward: loginViewModel.password) {
                            if loginViewModel.loginData != nil {
                                print("로그인 성공!")
                            } else {
                                print("로그인 실패")
                                // 팝업 - 로그인 실패
                                EmptyView()
                                    .popup(isPresented: $isLoginFailed) {
                                        WhitePopupBox()
                                    }
                                
                            }
                        }
                    }
                }
                // 회원가입 멘트
                HStack {
                    Spacer()
                    Text("계정이 존재하지 않는다면?")
                        .font(.sCoreDream(.medium, size: 12))
                        .foregroundStyle(.gray06)
                    Button("회원가입하기") {
                        // TODO: 회원가입 연결
                        loginViewModel.isSignUpButtonTapped = true
                    }
                    .font(.sCoreDream(.bold, size: 12))
                    .foregroundStyle(.primary05)
                    .fullScreenCover(isPresented: $loginViewModel.isSignUpButtonTapped) {
                        TermView()
                    }
                    Spacer()
                } //: 회원가입 멘트
                .padding(.top, 24)
                .padding(.bottom, 50)
            }
            .padding(.horizontal, 32)
            .background(
                RoundedRectangle(cornerRadius: 24)
                    .foregroundStyle(.white)
                    .ignoresSafeArea(.container)
            )
        } //: 로그인 메인
        .background(
            Image(.backgroundLogin)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
        )
        
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomNavigationBackButton(color: .white, title: "", dismiss: self.dismiss))
    } //: BODY
}

#Preview {
    LoginView()
}
