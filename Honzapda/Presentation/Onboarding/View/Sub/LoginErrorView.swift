//
//  LoginErrorView.swift
//  Honzapda
//
//  Created by YOUJIM on 5/9/24.
//

import SwiftUI

struct LoginErrorView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.black)
                .opacity(0.5)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(.white)
                            .frame(width: 320, height: 320)
                        
                        VStack {
                            Image(.imageLoginErrorNone)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 106, height: 106)
                                .padding(.top, 40)
                                .padding(.bottom, 24)
                            
                            Text("입력하신 정보가\n회원정보와 일치하지 않습니다.")
                                .font(.sCoreDream(.bold, size: 16))
                                .foregroundStyle(.primary06)
                                .multilineTextAlignment(.center)
                                .lineSpacing(9)
                                .padding(.bottom, 32)
                        
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Text("확인")
                                    .font(.sCoreDream(.medium, size: 12))
                                    .foregroundStyle(.white)
                            })
                            .background {
                                RoundedRectangle(cornerRadius: 8)
                                    .frame(width: 272, height: 45)
                                    .foregroundStyle(.primary05)
                            }
                            .padding(.bottom, 24)
                        }
                    }
                    Spacer()
                }
                Spacer()
            }
        }
    }
}

#Preview {
    LoginErrorView()
}
