//
//  LoginView.swift
//  Honzapda
//
//  Created by YOUJIM on 5/8/24.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var loginViewModel = LoginViewModel()
    
    var body: some View {
        ZStack {
            Image(.backgroundLogin)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                ZStack {
                    RoundedRectangle(cornerRadius: 24)
                        .foregroundStyle(.white)
                    
                    VStack {
                        HStack {
                            Text("로그인")
                                .font(.sCoreDream(.bold, size: 26))
                                .foregroundStyle(.primary06)
                                .padding(.top, 48)
                                .padding(.leading, 32)
                            
                            Spacer()
                        }
                        .padding(.bottom, 8)
                        
                        HStack {
                            Text("서비스 이용을 위해 HONZAPDA 계정으로 로그인하세요!")
                                .font(.sCoreDream(.medium, size: 12))
                                .foregroundStyle(.gray06)
                                .padding(.leading, 32)
                            
                            Spacer()
                        }
                        .padding(.bottom, 33)
                        
                        HStack {
                            Text("이메일")
                                .font(.sCoreDream(.bold, size: 14))
                                .foregroundStyle(.gray08)
                                .padding(.leading, 32)
                            
                            Spacer()
                        }
                        .padding(.bottom, 12)
                        
                        HStack {
                            TextField("아이디 입력", text: $loginViewModel.id)
                                .padding(.leading, 24)
                                .font(.sCoreDream(.medium, size: 12))
                                .tint(.gray06)
                                .frame(width: 329, height: 45)
                                .background {
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(.gray02)
                                }
                                .padding(.leading, 32)
                            
                            Spacer()
                        }
                        .padding(.bottom, 24)
                        
                        HStack {
                            Text("비밀번호")
                                .font(.sCoreDream(.bold, size: 14))
                                .foregroundStyle(.gray08)
                                .padding(.leading, 32)
                            
                            Spacer()
                        }
                        .padding(.bottom, 12)
                        
                        HStack {
                            SecureField("비밀번호 입력", text: $loginViewModel.password)
                                .padding(.leading, 24)
                                .font(.sCoreDream(.medium, size: 12))
                                .tint(.gray06)
                                .frame(width: 329, height: 45)
                                .background {
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(.gray02)
                                }
                                .padding(.leading, 32)
                            
                            Spacer()
                        }
                        .padding(.bottom, 16)
                        
                        HStack {
                            Button(action: {
                                loginViewModel.isAutoLoginEnabled.toggle()
                            }, label: {
                                HStack {
                                    if loginViewModel.isAutoLoginEnabled {
                                        Image(.iconOnboardingAutoLoginFill)
                                            .resizable()
                                            .frame(width: 12, height: 12)
                                            .aspectRatio(contentMode: .fill)
                                            .padding(.trailing, 8)
                                    } else {
                                        Image(.iconOnboardingAutoLoginNone)
                                            .resizable()
                                            .frame(width: 12, height: 12)
                                            .aspectRatio(contentMode: .fill)
                                            .padding(.trailing, 8)
                                    }
                                    
                                    Text("자동 로그인")
                                        .font(.sCoreDream(.medium, size: 10))
                                        .foregroundStyle(.gray08)
                                }
                            })
                            .frame(minWidth: 80)
                            .padding(.leading, 48)
                            .padding(.trailing, 80)
                            
                            
                            Button(action: {
                                // TODO: 아이디 찾기 화면으로 연결
                            }, label: {
                                Text("아이디 찾기")
                                    .font(.sCoreDream(.medium, size: 10))
                                    .tint(.gray07)
                            })
                            .frame(minWidth: 60)
                            .padding(.trailing, 8)
                            
                            Button(action: {
                                // TODO: 비밀번호 찾기 화면으로 연결
                            }, label: {
                                Text("비밀번호 찾기")
                                    .font(.sCoreDream(.medium, size: 10))
                                    .tint(.gray07)
                            })
                            .frame(minWidth: 60)
                            .padding(.trailing, 48)
                        }
                        .padding(.bottom, 56)
                        
                        if loginViewModel.id.isEmpty || loginViewModel.password.isEmpty {
                            Button(action: {}, label: {
                                Text("로그인")
                                    .font(.sCoreDream(.bold, size: 14))
                                    .tint(.white)
                            })
                            .background {
                                RoundedRectangle(cornerRadius: 8)
                                    .frame(width: 361, height: 45)
                                    .foregroundStyle(.gray04)
                            }
                            .padding(.bottom, 24)
                        } else {
                            Button(action: {
                                print("굿굿")
                            }, label: {
                                Text("로그인")
                                    .font(.sCoreDream(.bold, size: 16))
                                    .tint(.white)
                            })
                            .background {
                                RoundedRectangle(cornerRadius: 8)
                                    .frame(width: 361, height: 45)
                                    .foregroundStyle(.primary05)
                            }
                            .padding(.bottom, 24)
                        }
                        
                        HStack {
                            Spacer()
                            
                            Text("계정이 존재하지 않는다면?")
                                .font(.sCoreDream(.medium, size: 12))
                                .foregroundStyle(.gray06)
                            
                            Button(action: {
                                // TODO: 회원가입 연결
                            }, label: {
                                Text("회원가입하기")
                                    .font(.sCoreDream(.bold, size: 12))
                                    .foregroundStyle(.primary05)
                            })
                            
                            Spacer()
                        }
                        .padding(.bottom, 80)
                    }
                }
                .frame(height: 532)
            }
        }
    }
}

#Preview {
    LoginView()
}
